import 'package:flutter/material.dart';

import '../models/mini_app.dart';

class MiniAppTile extends StatelessWidget {
  const MiniAppTile({
    super.key,
    required this.miniApp,
    required this.onTap,
  });

  final MiniApp miniApp;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(miniApp.icon, size: 40, color: theme.colorScheme.primary),
              const Spacer(),
              Text(miniApp.name, style: theme.textTheme.titleMedium),
              const SizedBox(height: 4),
              Text(
                miniApp.description,
                style: theme.textTheme.bodySmall,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}