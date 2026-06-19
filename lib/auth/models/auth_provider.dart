import 'package:flutter/material.dart';

/// A third-party data source the office app can connect to.
///
/// Each provider authenticates with the same client-credentials shape
/// (a client/account id + a secret/api key exchanged for an access token),
/// so adding a new integration is just a new enum value plus its endpoint
/// config in [AuthApi].
enum AuthProvider {
  operto(
    displayName: 'Operto',
    description: 'Sync cleaning data directly from Operto Teams (replaces CSV uploads).',
    icon: Icons.cleaning_services_outlined,
    idLabel: 'API Key',
    secretLabel: 'API Value',
  ),
  hostaway(
    displayName: 'Hostaway',
    description: 'Pull reviews and cleaning revenue from Hostaway.',
    icon: Icons.reviews_outlined,
    idLabel: 'Account ID',
    secretLabel: 'API Key',
  );

  const AuthProvider({
    required this.displayName,
    required this.description,
    required this.icon,
    required this.idLabel,
    required this.secretLabel,
  });

  /// Human-readable name shown in the UI.
  final String displayName;

  /// Short blurb describing what connecting unlocks.
  final String description;

  /// Icon shown on the provider's card.
  final IconData icon;

  /// Label for the client/account id field.
  final String idLabel;

  /// Label for the secret/api-key field.
  final String secretLabel;

}
