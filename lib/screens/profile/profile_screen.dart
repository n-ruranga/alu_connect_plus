import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../providers/profile_provider.dart';
import '../../providers/event_provider.dart';
import 'saved_screen.dart';
import 'my_rsvps_screen.dart';
import 'settings_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = context.watch<ProfileProvider>();
    final events = context.watch<EventProvider>();
    final user = profile.user;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ── Header ──────────────────────────────────────────
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(20, 32, 20, 28),
                decoration: const BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(28),
                  ),
                ),
                child: Column(
                  children: [
                    // Avatar
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 48,
                          backgroundColor: AppColors.border,
                          child: Text(
                            user.name.isNotEmpty ? user.name[0] : 'A',
                            style: const TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(4),
                          child: const Icon(
                            Icons.edit,
                            size: 14,
                            color: AppColors.background,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Text(
                      user.name,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 14,
                          color: AppColors.textSecondary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          user.campus,
                          style: const TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    // Stats row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _StatTile(
                          label: 'Events\nJoined',
                          value: '${events.rsvpedEvents.length}',
                        ),
                        _Divider(),
                        _StatTile(
                          label: 'Communities',
                          value: '${user.communities}',
                        ),
                        _Divider(),
                        _StatTile(
                          label: 'Connections',
                          value: '${user.connections}',
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ── Quick Actions ────────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'My Activity',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _ActionTile(
                      icon: Icons.bookmark_rounded,
                      iconColor: AppColors.primary,
                      label: 'Saved Opportunities',
                      subtitle: '${events.savedEvents.length} saved',
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SavedScreen()),
                      ),
                    ),
                    _ActionTile(
                      icon: Icons.event_available_rounded,
                      iconColor: const Color(0xFF4ECDC4),
                      label: 'My RSVPs',
                      subtitle: '${events.rsvpedEvents.length} upcoming',
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const MyRsvpsScreen(),
                        ),
                      ),
                    ),
                    _ActionTile(
                      icon: Icons.people_alt_rounded,
                      iconColor: const Color(0xFFFF6B6B),
                      label: 'Communities',
                      subtitle: '${profile.joinedCommunities.length} joined',
                      onTap: () {},
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Account',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _ActionTile(
                      icon: Icons.settings_rounded,
                      iconColor: AppColors.textSecondary,
                      label: 'Settings',
                      subtitle: 'Notifications, appearance & more',
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SettingsScreen(),
                        ),
                      ),
                    ),
                    _ActionTile(
                      icon: Icons.logout_rounded,
                      iconColor: AppColors.error,
                      label: 'Log Out',
                      subtitle: '',
                      onTap: () => _confirmLogout(context),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.card,
        title: const Text(
          'Log Out',
          style: TextStyle(color: AppColors.textPrimary),
        ),
        content: const Text(
          'Are you sure you want to log out?',
          style: TextStyle(color: AppColors.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancel',
              style: TextStyle(color: AppColors.textSecondary),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Log Out',
              style: TextStyle(color: AppColors.error),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Supporting widgets ──────────────────────────────────────────────

class _StatTile extends StatelessWidget {
  final String label;
  final String value;
  const _StatTile({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: AppColors.primary,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(color: AppColors.textSecondary, fontSize: 12),
        ),
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(width: 1, height: 36, color: AppColors.border);
  }
}

class _ActionTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final String subtitle;
  final VoidCallback onTap;

  const _ActionTile({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.subtitle,
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
        subtitle: subtitle.isNotEmpty
            ? Text(
                subtitle,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                ),
              )
            : null,
        trailing: const Icon(
          Icons.chevron_right,
          color: AppColors.textSecondary,
          size: 18,
        ),
      ),
    );
  }
}
