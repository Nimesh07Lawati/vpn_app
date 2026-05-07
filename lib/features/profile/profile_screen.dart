import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vpn_app/features/auth/auth_provider.dart';
import 'package:vpn_app/features/profile/widgets/profile_app_bar.dart';
import 'package:vpn_app/features/profile/widgets/profile_app_header.dart';
import 'package:vpn_app/features/profile/widgets/profile_logout_button.dart';
import 'package:vpn_app/features/profile/widgets/profile_menu_item.dart';
import 'package:vpn_app/features/profile/widgets/profile_stats.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authProvider);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(color: Color.fromRGBO(38, 119, 119, 1)),
        child: SafeArea(
          child: Column(
            children: [
              const ProfileAppBar(),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      ProfileHeader(email: user.email ?? 'user@example.com'),
                      const SizedBox(height: 24),
                      const ProfileStats(),
                      const SizedBox(height: 24),
                      ProfileMenuItem(
                        icon: Icons.person_outline,
                        title: 'Account Information',
                        subtitle: 'View and edit your profile',
                        onTap: () {},
                      ),
                      ProfileMenuItem(
                        icon: Icons.credit_card,
                        title: 'Subscription Plan',
                        subtitle: 'Premium Plan • Renews on Dec 31, 2025',
                        onTap: () {},
                      ),
                      ProfileMenuItem(
                        icon: Icons.history,
                        title: 'Connection History',
                        subtitle: 'View your recent connections',
                        onTap: () {},
                      ),
                      ProfileMenuItem(
                        icon: Icons.settings,
                        title: 'Settings',
                        subtitle: 'App preferences and configurations',
                        onTap: () {},
                      ),
                      ProfileMenuItem(
                        icon: Icons.help_outline,
                        title: 'Help & Support',
                        subtitle: 'FAQs and customer support',
                        onTap: () {},
                      ),
                      ProfileMenuItem(
                        icon: Icons.privacy_tip,
                        title: 'Privacy Policy',
                        subtitle: 'Read our privacy policy',
                        onTap: () {},
                      ),
                      const SizedBox(height: 16),
                      const ProfileLogoutButton(),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
