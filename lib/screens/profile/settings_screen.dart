import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _eventNotifications = true;
  bool _communityNotifications = true;
  bool _messageNotifications = false;
  bool _darkMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.textPrimary,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Settings',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        children: [
          // ── Notifications ───────────────────────────────────────
          _SectionHeader(title: 'Notifications'),
          _ToggleTile(
            icon: Icons.event_rounded,
            iconColor: AppColors.primary,
            label: 'Event Reminders',
            subtitle: 'Get notified before events you RSVPd to',
            value: _eventNotifications,
            onChanged: (val) => setState(() => _eventNotifications = val),
          ),
          _ToggleTile(
            icon: Icons.group_rounded,
            iconColor: const Color(0xFF4ECDC4),
            label: 'Community Updates',
            subtitle: 'New posts and announcements',
            value: _communityNotifications,
            onChanged: (val) => setState(() => _communityNotifications = val),
          ),
          _ToggleTile(
            icon: Icons.chat_bubble_rounded,
            iconColor: const Color(0xFFFF6B6B),
            label: 'Messages',
            subtitle: 'Direct messages and chat activity',
            value: _messageNotifications,
            onChanged: (val) => setState(() => _messageNotifications = val),
          ),

          const SizedBox(height: 8),

          // ── Appearance ──────────────────────────────────────────
          _SectionHeader(title: 'Appearance'),
          _ToggleTile(
            icon: Icons.dark_mode_rounded,
            iconColor: const Color(0xFF9B8FFF),
            label: 'Dark Mode',
            subtitle: 'Uses the ALU Connect+ dark theme',
            value: _darkMode,
            onChanged: (val) {
              setState(() => _darkMode = val);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Theme preference saved'),
                  backgroundColor: AppColors.card,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
          ),

          const SizedBox(height: 8),

          // ── Help & Support ──────────────────────────────────────
          _SectionHeader(title: 'Help & Support'),
          _TapTile(
            icon: Icons.help_outline_rounded,
            iconColor: AppColors.primary,
            label: 'FAQs',
            onTap: () => _showInfoDialog(
              context,
              'FAQs',
              'Browse common questions about ALU Connect+.',
            ),
          ),
          _TapTile(
            icon: Icons.bug_report_rounded,
            iconColor: const Color(0xFFFF6B6B),
            label: 'Report a Problem',
            onTap: () => _showInfoDialog(
              context,
              'Report a Problem',
              'Send feedback to the ALU Connect+ team.',
            ),
          ),
          _TapTile(
            icon: Icons.info_outline_rounded,
            iconColor: AppColors.textSecondary,
            label: 'About ALU Connect+',
            onTap: () => _showInfoDialog(
              context,
              'About ALU Connect+',
              'Version 1.0.0\n\nBuilt by ALU students, for ALU students.\nConnecting campus communities across Africa.',
            ),
          ),

          const SizedBox(height: 32),

          // App version
          Center(
            child: Text(
              'ALU Connect+  •  v1.0.0',
              style: const TextStyle(color: AppColors.border, fontSize: 12),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  void _showInfoDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.card,
        title: Text(
          title,
          style: const TextStyle(color: AppColors.textPrimary),
        ),
        content: Text(
          message,
          style: const TextStyle(color: AppColors.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK', style: TextStyle(color: AppColors.primary)),
          ),
        ],
      ),
    );
  }
}

// ── Supporting widgets ──────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 4),
      child: Text(
        title,
        style: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}

class _ToggleTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _ToggleTile({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.12),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: iconColor, size: 20),
        ),
        title: Text(
          label,
          style: const TextStyle(color: AppColors.textPrimary, fontSize: 14),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: AppColors.textSecondary, fontSize: 12),
        ),
        trailing: Switch(
          value: value,
          onChanged: onChanged,
          activeColor: AppColors.primary,
          inactiveThumbColor: AppColors.textSecondary,
          inactiveTrackColor: AppColors.border,
        ),
      ),
    );
  }
}

class _TapTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final VoidCallback onTap;

  const _TapTile({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.12),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: iconColor, size: 20),
        ),
        title: Text(
          label,
          style: const TextStyle(color: AppColors.textPrimary, fontSize: 14),
        ),
        trailing: const Icon(
          Icons.chevron_right,
          color: AppColors.textSecondary,
          size: 18,
        ),
      ),
    );
  }
}
