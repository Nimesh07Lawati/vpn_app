import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vpn_app/core/styles/app_text_styles.dart';
import 'package:vpn_app/core/widgets/glass_text_input_field.dart';
import 'package:vpn_app/core/widgets/auth_glass_card.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/app_images/background.png',
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
          ),

          // Dark overlay
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.3)),
          ),

          // Signup Card
          AuthGlassCard(
            title: 'Create Account',
            subtitle: 'Sign up to get started',
            children: [
              const GlassTextField(
                hintText: 'Full Name',
                icon: Icons.person_outline,
              ),

              const SizedBox(height: 20),

              const GlassTextField(
                hintText: 'Email',
                icon: Icons.email_outlined,
              ),

              const SizedBox(height: 20),

              const GlassTextField(
                hintText: 'Password',
                icon: Icons.lock_outline,
                obscureText: true,
              ),

              const SizedBox(height: 20),

              const GlassTextField(
                hintText: 'Confirm Password',
                icon: Icons.lock_outline,
                obscureText: true,
              ),

              const SizedBox(height: 24),

              // Sign Up Button
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.deepPurple.shade700,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
                ),
                child: const Text('Sign Up', style: AppTextStyles.buttonText),
              ),

              const SizedBox(height: 20),

              // Divider
              Row(
                children: [
                  Expanded(
                    child: Divider(color: Colors.white.withOpacity(0.3)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text('OR', style: AppTextStyles.divider),
                  ),
                  Expanded(
                    child: Divider(color: Colors.white.withOpacity(0.3)),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Social Signup Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialButton(Icons.g_mobiledata),
                  const SizedBox(width: 20),
                  _buildSocialButton(Icons.apple),
                  const SizedBox(width: 20),
                  _buildSocialButton(Icons.facebook),
                ],
              ),

              const SizedBox(height: 24),

              // Login Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? ", style: AppTextStyles.small),
                  GestureDetector(
                    onTap: () {
                      context.go('/login'); // go back to login
                    },
                    child: Text('Login', style: AppTextStyles.boldLink),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton(IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.3)),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(icon, color: Colors.white, size: 28),
        padding: const EdgeInsets.all(12),
      ),
    );
  }
}
