import 'package:flutter/material.dart';

import '../../layout/tablet_scaffold.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabletScaffold(
      title: 'Settings',
      child: ListView(
        children: [
          ListTile(
            title: Text('Account'),
            subtitle: Text('Profile, security, and preferences'),
          ),
          Divider(height: 1),
          ListTile(
            title: Text('Notifications'),
            subtitle: Text('Push and email settings'),
          ),
          Divider(height: 1),
          ListTile(
            title: Text('Storage'),
            subtitle: Text('Manage local files and cache'),
          ),
        ],
      ),
    );
  }
}
