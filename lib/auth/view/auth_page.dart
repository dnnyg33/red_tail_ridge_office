import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';
import '../models/auth_provider.dart';
import '../models/auth_session.dart';

/// "Connections" mini app: connect/disconnect the data sources whose tokens
/// the [AuthBloc] persists. Uses the app-wide [AuthBloc] from the widget tree.
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Connections'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              for (final provider in AuthProvider.values)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: _ProviderCard(provider: provider),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProviderCard extends StatefulWidget {
  const _ProviderCard({required this.provider});

  final AuthProvider provider;

  @override
  State<_ProviderCard> createState() => _ProviderCardState();
}

class _ProviderCardState extends State<_ProviderCard> {
  final _idController = TextEditingController();
  final _secretController = TextEditingController();
  bool _obscureSecret = true;

  @override
  void dispose() {
    _idController.dispose();
    _secretController.dispose();
    super.dispose();
  }

  void _connect() {
    FocusScope.of(context).unfocus();
    context.read<AuthBloc>().add(
          AuthLoginRequested(
            provider: widget.provider,
            clientId: _idController.text,
            clientSecret: _secretController.text,
          ),
        );
  }

  void _disconnect() {
    context.read<AuthBloc>().add(AuthLoggedOut(widget.provider));
    _idController.clear();
    _secretController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final provider = widget.provider;

    return BlocConsumer<AuthBloc, AuthState>(
      listenWhen: (prev, curr) =>
          curr.authenticatingProvider == null &&
          prev.loginStatus != curr.loginStatus,
      listener: (context, state) {
        final status = state.loginStatus;
        if (status.isSuccess && status.successData == provider) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text('Connected to ${provider.displayName}.')),
            );
        }
      },
      builder: (context, state) {
        final session = state.sessionFor(provider);
        final isConnected = session != null;
        final isThisProcessing =
            state.loginStatus.isProcessing &&
                state.authenticatingProvider == provider;
        final error = !state.loginStatus.isProcessing &&
                state.authenticatingProvider == null &&
                state.loginStatus.hasError
            ? state.loginStatus.error
            : null;

        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(provider.icon, color: theme.colorScheme.primary),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        provider.displayName,
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    _StatusChip(connected: isConnected),
                  ],
                ),
                const SizedBox(height: 8),
                Text(provider.description, style: theme.textTheme.bodyMedium),
                const SizedBox(height: 16),
                if (isConnected)
                  _ConnectedDetails(
                    session: session,
                    onDisconnect: _disconnect,
                  )
                else
                  _CredentialsForm(
                    provider: provider,
                    idController: _idController,
                    secretController: _secretController,
                    obscureSecret: _obscureSecret,
                    onToggleObscure: () =>
                        setState(() => _obscureSecret = !_obscureSecret),
                    isProcessing: isThisProcessing,
                    onConnect: _connect,
                  ),
                if (error != null) ...[
                  const SizedBox(height: 12),
                  Text(
                    error,
                    style: theme.textTheme.bodySmall
                        ?.copyWith(color: theme.colorScheme.error),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}

class _CredentialsForm extends StatelessWidget {
  const _CredentialsForm({
    required this.provider,
    required this.idController,
    required this.secretController,
    required this.obscureSecret,
    required this.onToggleObscure,
    required this.isProcessing,
    required this.onConnect,
  });

  final AuthProvider provider;
  final TextEditingController idController;
  final TextEditingController secretController;
  final bool obscureSecret;
  final VoidCallback onToggleObscure;
  final bool isProcessing;
  final VoidCallback onConnect;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: idController,
          enabled: !isProcessing,
          decoration: InputDecoration(
            labelText: provider.idLabel,
            border: const OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: secretController,
          enabled: !isProcessing,
          obscureText: obscureSecret,
          decoration: InputDecoration(
            labelText: provider.secretLabel,
            border: const OutlineInputBorder(),
            suffixIcon: IconButton(
              icon: Icon(
                obscureSecret ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: onToggleObscure,
            ),
          ),
        ),
        const SizedBox(height: 16),
        FilledButton.icon(
          onPressed: isProcessing ? null : onConnect,
          icon: isProcessing
              ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.link),
          label: Text(isProcessing ? 'Connecting…' : 'Connect'),
        ),
      ],
    );
  }
}

class _ConnectedDetails extends StatelessWidget {
  const _ConnectedDetails({required this.session, required this.onDisconnect});

  final AuthSession session;
  final VoidCallback onDisconnect;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final expiresAt = session.expiresAt;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          session.isExpired
              ? 'Token expired — reconnect to refresh.'
              : expiresAt != null
                  ? 'Token valid until ${_formatDate(expiresAt)}.'
                  : 'Token stored.',
          style: theme.textTheme.bodySmall?.copyWith(
            color: session.isExpired
                ? theme.colorScheme.error
                : theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 12),
        OutlinedButton.icon(
          onPressed: onDisconnect,
          icon: const Icon(Icons.link_off),
          label: const Text('Disconnect'),
        ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    final local = date.toLocal();
    final y = local.year.toString().padLeft(4, '0');
    final m = local.month.toString().padLeft(2, '0');
    final d = local.day.toString().padLeft(2, '0');
    return '$y-$m-$d';
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.connected});

  final bool connected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color =
        connected ? Colors.green : theme.colorScheme.onSurfaceVariant;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          connected ? Icons.check_circle : Icons.circle_outlined,
          size: 16,
          color: color,
        ),
        const SizedBox(width: 4),
        Text(
          connected ? 'Connected' : 'Not connected',
          style: theme.textTheme.labelMedium?.copyWith(color: color),
        ),
      ],
    );
  }
}
