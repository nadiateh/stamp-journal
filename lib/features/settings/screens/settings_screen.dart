import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Settings', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 8),
          Text(
            'Make your journal feel like yours.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 32),
          _SettingsTile(
            icon: Icons.palette_outlined,
            title: 'Appearance',
            subtitle: 'Themes and notebook styles',
          ),
          _SettingsTile(
            icon: Icons.camera_alt_outlined,
            title: 'Camera preferences',
            subtitle: 'Default template and camera settings',
          ),
          _SettingsTile(
            icon: Icons.storage_outlined,
            title: 'Storage',
            subtitle: 'Manage your saved stamps',
          ),
          _SettingsTile(
            icon: Icons.backup_outlined,
            title: 'Backup and export',
            subtitle: 'Keep a copy of your journal',
          ),
          _SettingsTile(
            icon: Icons.info_outline,
            title: 'About',
            subtitle: 'Application information',
          ),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _SettingsTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 6),
      leading: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: AppColors.linen,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Icon(icon, color: AppColors.terracotta),
      ),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      subtitle: Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
      trailing: const Icon(
        Icons.chevron_right_rounded,
        color: AppColors.mutedBrown,
      ),
    );
  }
}
