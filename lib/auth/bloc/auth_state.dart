part of 'auth_bloc.dart';

@freezed
abstract class AuthState with _$AuthState {
  const AuthState._();

  const factory AuthState({
    /// Active connections keyed by provider.
    @Default(<AuthProvider, AuthSession>{})
    Map<AuthProvider, AuthSession> sessions,

    /// Status of the in-flight login; success data is the provider connected.
    @Default(AsyncOperation<AuthProvider>.idle())
    AsyncOperation<AuthProvider> loginStatus,

    /// Provider currently being authenticated, if any.
    AuthProvider? authenticatingProvider,
  }) = _AuthState;

  AuthSession? sessionFor(AuthProvider provider) => sessions[provider];

  bool isConnected(AuthProvider provider) => sessions.containsKey(provider);
}
