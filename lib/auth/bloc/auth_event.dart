part of 'auth_bloc.dart';

@freezed
sealed class AuthEvent with _$AuthEvent {
  /// Exchange [clientId] + [clientSecret] for an access token for [provider].
  const factory AuthEvent.loginRequested({
    required AuthProvider provider,
    required String clientId,
    required String clientSecret,
  }) = AuthLoginRequested;

  /// Drop the stored session for [provider].
  const factory AuthEvent.loggedOut(AuthProvider provider) = AuthLoggedOut;

  /// Persist a session whose token was silently renewed at point of use.
  const factory AuthEvent.sessionRenewed(AuthSession session) =
      AuthSessionRenewed;
}
