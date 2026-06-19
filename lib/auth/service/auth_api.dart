import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/auth_provider.dart';
import '../models/auth_session.dart';

/// Thrown when a provider rejects the supplied credentials or returns an
/// unexpected response. [message] is safe to surface to the user.
class AuthException implements Exception {
  const AuthException(this.message);
  final String message;

  @override
  String toString() => 'AuthException: $message';
}

/// Authenticates against each data source and returns a persistable
/// [AuthSession]. Every provider takes the same two inputs ([clientId] +
/// [clientSecret]) but the request/response shapes differ, so each has its
/// own handler.
class AuthApi {
  AuthApi({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;

  // Operto Teams login: JSON body with API_Key/API_Value. The login itself
  // needs no auth header; it returns a customer-scoped `VRS` JWT that later
  // API calls send as `Authorization: VRS <jwt>`.
  static final Uri _opertoLoginUri =
      Uri.parse('https://teams-api.operto.com/api/v1/oauth/login');

  // Operto refresh: GET with `Authorization: VRS <refresh_token>`; returns a
  // fresh Access_Token only (the refresh token is reused until it expires).
  static final Uri _opertoRefreshUri =
      Uri.parse('https://teams-api.operto.com/api/v1/oauth/refresh');

  // Hostaway uses a standard OAuth2 client_credentials grant.
  // https://api.hostaway.com/documentation#authentication
  static final Uri _hostawayTokenUri =
      Uri.parse('https://api.hostaway.com/v1/accessTokens');

  Future<AuthSession> authenticate({
    required AuthProvider provider,
    required String clientId,
    required String clientSecret,
  }) {
    switch (provider) {
      case AuthProvider.operto:
        return _opertoLogin(clientId, clientSecret);
      case AuthProvider.hostaway:
        return _hostawayLogin(clientId, clientSecret);
    }
  }

  /// Returns a session with a renewed access token. For Operto this exchanges
  /// the (still-valid) refresh token; otherwise — or if the refresh is
  /// rejected — it falls back to a full re-login with the stored credentials.
  Future<AuthSession> refresh(AuthSession current) async {
    if (current.provider == AuthProvider.operto &&
        current.refreshToken != null &&
        !current.isRefreshExpired) {
      try {
        return await _opertoRefresh(current);
      } on AuthException {
        // Refresh token rejected server-side — fall through to re-login.
      }
    }
    return authenticate(
      provider: current.provider,
      clientId: current.clientId,
      clientSecret: current.clientSecret,
    );
  }

  Future<AuthSession> _opertoRefresh(AuthSession current) async {
    final response = await _get(
      AuthProvider.operto,
      _opertoRefreshUri,
      headers: {
        'Authorization': 'VRS ${current.refreshToken}',
        'Accept': 'application/json',
      },
    );
    final json = _decodeJson(response, AuthProvider.operto);
    final access = _opertoToken(json['Access_Token'], 'access');
    return current.copyWith(
      accessToken: access.token,
      expiresAt: access.expiresAt,
      obtainedAt: DateTime.now(),
    );
  }

  Future<AuthSession> _opertoLogin(String apiKey, String apiValue) async {
    final response = await _post(
      AuthProvider.operto,
      _opertoLoginUri,
      headers: const {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({'API_Key': apiKey, 'API_Value': apiValue}),
    );

    // Response shape:
    // { "Access_Token": {token, Created, Expiry}, "Refresh_Token": {...} }
    // where Expiry is a TTL in seconds.
    final json = _decodeJson(response, AuthProvider.operto);
    final access = _opertoToken(json['Access_Token'], 'access');
    final refresh = json['Refresh_Token'] is Map<String, dynamic>
        ? _opertoToken(json['Refresh_Token'], 'refresh')
        : null;

    return AuthSession(
      provider: AuthProvider.operto,
      accessToken: access.token,
      tokenType: 'VRS',
      clientId: apiKey,
      clientSecret: apiValue,
      expiresAt: access.expiresAt,
      refreshToken: refresh?.token,
      refreshExpiresAt: refresh?.expiresAt,
      obtainedAt: DateTime.now(),
    );
  }

  ({String token, DateTime? expiresAt}) _opertoToken(
    Object? raw,
    String which,
  ) {
    if (raw is! Map<String, dynamic>) {
      throw AuthException('Operto did not return a $which token.');
    }
    final token = raw['token'] as String?;
    if (token == null || token.isEmpty) {
      throw AuthException('Operto did not return a $which token.');
    }
    // Operto returns Expiry as a string ("3600") or a number.
    final expiry = raw['Expiry'];
    final expirySeconds =
        expiry is num ? expiry.toInt() : int.tryParse('$expiry');
    return (
      token: token,
      expiresAt: expirySeconds == null
          ? null
          : DateTime.now().add(Duration(seconds: expirySeconds)),
    );
  }

  Future<AuthSession> _hostawayLogin(
    String clientId,
    String clientSecret,
  ) async {
    final response = await _post(
      AuthProvider.hostaway,
      _hostawayTokenUri,
      headers: const {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Accept': 'application/json',
        'Cache-Control': 'no-cache',
      },
      body: {
        'grant_type': 'client_credentials',
        'client_id': clientId,
        'client_secret': clientSecret,
        'scope': 'general',
      },
    );

    final json = _decodeJson(response, AuthProvider.hostaway);
    final token = json['access_token'] as String?;
    if (token == null || token.isEmpty) {
      throw const AuthException('Hostaway did not return an access token.');
    }
    final expiresIn = (json['expires_in'] as num?)?.toInt();
    return AuthSession(
      provider: AuthProvider.hostaway,
      accessToken: token,
      tokenType: (json['token_type'] as String?) ?? 'Bearer',
      clientId: clientId,
      clientSecret: clientSecret,
      expiresAt: expiresIn == null
          ? null
          : DateTime.now().add(Duration(seconds: expiresIn)),
      obtainedAt: DateTime.now(),
    );
  }

  /// Operto returns 201 on login, so accept any 2xx as success.
  bool _isOk(int statusCode) => statusCode >= 200 && statusCode < 300;

  Future<http.Response> _post(
    AuthProvider provider,
    Uri uri, {
    required Map<String, String> headers,
    required Object body,
  }) async {
    final http.Response response;
    try {
      response = await _client.post(uri, headers: headers, body: body);
    } catch (_) {
      throw AuthException(
        'Could not reach ${provider.displayName}. Check your connection.',
      );
    }
    if (!_isOk(response.statusCode)) {
      throw AuthException(
        '${provider.displayName} rejected the credentials '
        '(${response.statusCode}).',
      );
    }
    return response;
  }

  Future<http.Response> _get(
    AuthProvider provider,
    Uri uri, {
    required Map<String, String> headers,
  }) async {
    final http.Response response;
    try {
      response = await _client.get(uri, headers: headers);
    } catch (_) {
      throw AuthException(
        'Could not reach ${provider.displayName}. Check your connection.',
      );
    }
    if (!_isOk(response.statusCode)) {
      throw AuthException(
        '${provider.displayName} request failed (${response.statusCode}).',
      );
    }
    return response;
  }

  Map<String, dynamic> _decodeJson(
    http.Response response,
    AuthProvider provider,
  ) {
    try {
      final decoded = jsonDecode(response.body);
      if (decoded is Map<String, dynamic>) return decoded;
    } catch (_) {
      // fall through
    }
    throw AuthException('Unexpected response from ${provider.displayName}.');
  }
}
