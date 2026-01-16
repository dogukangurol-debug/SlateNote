import 'package:flutter/material.dart';

class AppTopBar extends StatelessWidget {
  const AppTopBar({
    super.key,
    required this.title,
    this.trailing,
    this.onOpenTools,
    this.showToolsButton = false,
  });

  final String title;
  final Widget? trailing;
  final VoidCallback? onOpenTools;
  final bool showToolsButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          if (showToolsButton)
            IconButton(
              icon: const Icon(Icons.tune),
              tooltip: 'Open tools',
              onPressed: onOpenTools,
            ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
