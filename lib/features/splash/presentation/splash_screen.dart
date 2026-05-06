// splash/view/splash_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vpn_app/core/extension/state_extension.dart';
import 'package:vpn_app/features/splash/viewmodel/splash_view_model.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final splashState = ref.watch(splashViewModelProvider); // Watch the state

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/app_images/background.png',
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
          ),

          // Overlay
          Positioned.fill(
            child: Container(color: Colors.black.withValues(alpha: 0.3)),
          ),

          // Foreground content — driven by state
          Center(
            child: splashState.status.whenOrNull(
              initial: () => const SizedBox.shrink(),
              isLoading: () =>
                  const CircularProgressIndicator(color: Colors.white),
              success: () => const Icon(
                Icons.check_circle_outline,
                color: Colors.white,
                size: 64,
              ),
              error: () => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.error_outline, color: Colors.red, size: 64),
                  const SizedBox(height: 12),
                  Text(
                    splashState.errorMessage ?? 'Something went wrong',
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
