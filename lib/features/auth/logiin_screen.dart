import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vpn_app/core/styles/app_text_styles.dart';
import 'package:vpn_app/core/widgets/glass_text_input_field.dart';
import 'package:vpn_app/core/widgets/auth_glass_card.dart';
import 'package:vpn_app/features/auth/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            child: Container(color: Colors.black.withValues(alpha: 0.3)),
          ),

          // Login Card
          AuthGlassCard(
            title: 'Welcome Back',
            subtitle: 'Sign in to continue',
            children: [
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
              const SizedBox(height: 12),
              // Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text('Forgot Password?', style: AppTextStyles.link),
                ),
              ),
              const SizedBox(height: 8),
              // Login Button
              ElevatedButton(
                onPressed: () {
                  context.go('/home');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.deepPurple.shade700,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
                ),
                child: const Text('Login', style: AppTextStyles.buttonText),
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

              // Social Buttons
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

              // Sign Up Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? ", style: AppTextStyles.small),
                  GestureDetector(
                    onTap: () {
                      context.go('/signup');
                    },
                    child: Text('Sign Up', style: AppTextStyles.boldLink),
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
