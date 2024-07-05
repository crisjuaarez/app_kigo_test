import 'package:flutter/material.dart';

import '../../../../../ui/theme/app_theme.dart';

class ProfileItemTile extends StatelessWidget {
  const ProfileItemTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: AppTheme.secondaryColor),
      title: Text(
        title,
        style: const TextStyle(color: AppTheme.secondaryColor),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Colors.grey.shade700),
      ),
    );
  }
}
