import 'package:equatable/equatable.dart';

import 'auth_provider.dart';

/// A persisted authenticated connection to a [AuthProvider].
///
/// Stored verbatim by the [AuthBloc] via `hydrated_bloc`, so it is plain and
/// JSON-serializable. The credentials are retained alongside the tokens so an
/// expired token can be silently re-fetched without prompting again — note
/// this means the secret lives in local storage.
class AuthSession extends Equatable {
  const AuthSession({
    required this.provider,
    required this.accessToken,
    required this.clientId,
    required this.clientSecret,
    required this.obtainedAt,
    this.tokenType = 'Bearer',
    this.expiresAt,
    this.refreshToken,
    this.refreshExpiresAt,
  });

  final AuthProvider provider;
  final String accessToken;

  /// Credentials used to obtain the tokens; kept for silent re-auth.
  final String clientId;
  final String clientSecret;

  final DateTime obtainedAt;
  final String tokenType;

  /// When [accessToken] stops being valid.
  final DateTime? expiresAt;

  /// Longer-lived token used to mint a new access token without re-login.
  final String? refreshToken;

  /// When [refreshToken] stops being valid.
  final DateTime? refreshExpiresAt;

  /// Ready-to-use value for an `Authorization` header, e.g. `VRS <jwt>`.
  String get authorizationHeader => '$tokenType $accessToken';

  bool get isExpired =>
      expiresAt != null && DateTime.now().isAfter(expiresAt!);

  bool get isRefreshExpired =>
      refreshExpiresAt != null &&
      DateTime.now().isAfter(refreshExpiresAt!);

  /// Renew slightly early so a request never goes out with a token that lapses
  /// mid-flight. Sessions with no expiry never need renewal.
  bool get needsRenewal =>
      expiresAt != null &&
      DateTime.now()
          .isAfter(expiresAt!.subtract(const Duration(seconds: 60)));

  AuthSession copyWith({
    String? accessToken,
    String? tokenType,
    DateTime? expiresAt,
    DateTime? obtainedAt,
    String? refreshToken,
    DateTime? refreshExpiresAt,
  }) {
    return AuthSession(
      provider: provider,
      accessToken: accessToken ?? this.accessToken,
      clientId: clientId,
      clientSecret: clientSecret,
      tokenType: tokenType ?? this.tokenType,
      expiresAt: expiresAt ?? this.expiresAt,
      obtainedAt: obtainedAt ?? this.obtainedAt,
      refreshToken: refreshToken ?? this.refreshToken,
      refreshExpiresAt: refreshExpiresAt ?? this.refreshExpiresAt,
    );
  }

  Map<String, dynamic> toJson() => {
        'provider': provider.name,
        'accessToken': accessToken,
        'clientId': clientId,
        'clientSecret': clientSecret,
        'tokenType': tokenType,
        'expiresAt': expiresAt?.toIso8601String(),
        'obtainedAt': obtainedAt.toIso8601String(),
        'refreshToken': refreshToken,
        'refreshExpiresAt': refreshExpiresAt?.toIso8601String(),
      };

  factory AuthSession.fromJson(Map<String, dynamic> json) {
    DateTime? parseDate(Object? value) =>
        value is String ? DateTime.tryParse(value) : null;

    return AuthSession(
      provider: AuthProvider.values.byName(json['provider'] as String),
      accessToken: json['accessToken'] as String,
      clientId: json['clientId'] as String? ?? '',
      clientSecret: json['clientSecret'] as String? ?? '',
      tokenType: json['tokenType'] as String? ?? 'Bearer',
      expiresAt: parseDate(json['expiresAt']),
      obtainedAt: parseDate(json['obtainedAt']) ?? DateTime.now(),
      refreshToken: json['refreshToken'] as String?,
      refreshExpiresAt: parseDate(json['refreshExpiresAt']),
    );
  }

  @override
  List<Object?> get props => [
        provider,
        accessToken,
        clientId,
        clientSecret,
        tokenType,
        expiresAt,
        obtainedAt,
        refreshToken,
        refreshExpiresAt,
      ];
}
