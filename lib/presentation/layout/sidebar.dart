import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  static const double width = 240;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      color: const Color(0xFF1E2430),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'SlateNote',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Divider(color: Colors.white24),
            _NavItem(
              label: 'Notebooks',
              icon: Icons.book,
              location: '/notebooks',
            ),
            _NavItem(
              label: 'Docs',
              icon: Icons.description,
              location: '/docs',
            ),
            _NavItem(
              label: 'Projects',
              icon: Icons.workspaces,
              location: '/projects',
            ),
            _NavItem(
              label: 'Wiki',
              icon: Icons.auto_stories,
              location: '/wiki',
            ),
            _NavItem(
              label: 'Forms',
              icon: Icons.list_alt,
              location: '/forms',
            ),
            const Spacer(),
            _NavItem(
              label: 'Settings',
              icon: Icons.settings,
              location: '/settings',
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.label,
    required this.icon,
    required this.location,
  });

  final String label;
  final IconData icon;
  final String location;

  @override
  Widget build(BuildContext context) {
    final isSelected = GoRouterState.of(context).matchedLocation == location;

    return ListTile(
      selected: isSelected,
      selectedTileColor: Colors.white10,
      leading: Icon(icon, color: Colors.white70),
      title: Text(
        label,
        style: const TextStyle(color: Colors.white70),
      ),
      onTap: () {
        if (GoRouterState.of(context).matchedLocation != location) {
          context.go(location);
        }
      },
    );
  }
}
