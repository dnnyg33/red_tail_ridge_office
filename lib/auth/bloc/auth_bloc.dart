import 'package:flutter_utils/networking/async_operation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../models/auth_provider.dart';
import '../models/auth_session.dart';
import '../service/auth_api.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

/// Holds authenticated [AuthSession]s for each connected [AuthProvider].
///
/// Sessions are persisted via `hydrated_bloc`, so a token obtained on one
/// launch is still available on the next — no user accounts to manage.
class AuthBloc extends HydratedBloc<AuthEvent, AuthState> {
  AuthBloc({AuthApi? api})
      : _api = api ?? AuthApi(),
        super(const AuthState()) {
    on<AuthLoginRequested>(_onLoginRequested);
    on<AuthLoggedOut>(_onLoggedOut);
    on<AuthSessionRenewed>(_onSessionRenewed);
  }

  final AuthApi _api;

  /// Renewals in progress, keyed by provider, so concurrent callers share one
  /// network round-trip instead of each kicking off its own.
  final Map<AuthProvider, Future<AuthSession?>> _renewals = {};

  /// Returns a non-expired session for [provider], transparently renewing the
  /// token first if it is at/near expiry. Returns null if not connected or if
  /// renewal fails. Call this right before using a provider's API.
  Future<AuthSession?> ensureValidSession(AuthProvider provider) async {
    final current = state.sessionFor(provider);
    if (current == null) return null;
    if (!current.needsRenewal) return current;

    final inFlight = _renewals[provider];
    if (inFlight != null) return inFlight;

    final future = _renew(current);
    _renewals[provider] = future;
    try {
      return await future;
    } finally {
      _renewals.remove(provider);
    }
  }

  Future<AuthSession?> _renew(AuthSession current) async {
    try {
      final renewed = await _api.refresh(current);
      if (!isClosed) add(AuthSessionRenewed(renewed));
      return renewed;
    } catch (_) {
      return null;
    }
  }

  Future<void> _onLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(
      loginStatus: const AsyncOperation.processing(),
      authenticatingProvider: event.provider,
    ));
    try {
      final session = await _api.authenticate(
        provider: event.provider,
        clientId: event.clientId.trim(),
        clientSecret: event.clientSecret.trim(),
      );
      emit(state.copyWith(
        sessions: {...state.sessions, event.provider: session},
        loginStatus: AsyncOperation.success(data: event.provider),
        authenticatingProvider: null,
      ));
    } on AuthException catch (e) {
      emit(state.copyWith(
        loginStatus: AsyncOperation.error(error: e.message),
        authenticatingProvider: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        loginStatus: AsyncOperation.error(error: 'Login failed: $e'),
        authenticatingProvider: null,
      ));
    }
  }

  void _onLoggedOut(AuthLoggedOut event, Emitter<AuthState> emit) {
    final sessions = Map<AuthProvider, AuthSession>.of(state.sessions)
      ..remove(event.provider);
    emit(state.copyWith(
      sessions: sessions,
      loginStatus: const AsyncOperation.idle(),
    ));
  }

  void _onSessionRenewed(AuthSessionRenewed event, Emitter<AuthState> emit) {
    emit(state.copyWith(
      sessions: {...state.sessions, event.session.provider: event.session},
    ));
  }

  @override
  AuthState fromJson(Map<String, dynamic> json) {
    final raw = json['sessions'] as Map<String, dynamic>? ?? const {};
    final byName = AuthProvider.values.asNameMap();
    final sessions = <AuthProvider, AuthSession>{};
    for (final entry in raw.entries) {
      final provider = byName[entry.key];
      if (provider == null) continue;
      sessions[provider] =
          AuthSession.fromJson(entry.value as Map<String, dynamic>);
    }
    return AuthState(sessions: sessions);
  }

  @override
  Map<String, dynamic> toJson(AuthState state) {
    return {
      'sessions': {
        for (final entry in state.sessions.entries)
          entry.key.name: entry.value.toJson(),
      },
    };
  }
}
