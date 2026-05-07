import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:vpn_app/core/extension/state_extension.dart';
import 'package:vpn_app/features/splash/viewmodel/splash_view_model.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(splashViewModelProvider.notifier)
          .init(
            onSuccess: () {
              if (mounted) context.go('/login');
            },
          );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final splashState = ref.watch(splashViewModelProvider);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            // ── Lottie animation centered ──
            Center(
              child: Lottie.asset(
                'assets/splash/VPN.json',
                controller: _controller,
                width: 280,
                height: 280,
                fit: BoxFit.contain,
                onLoaded: (composition) {
                  _controller
                    ..duration = composition.duration
                    ..forward();
                  // animation plays once and stops —
                  // navigation is handled by splashViewModel
                },
              ),
            ),

            // ── Status indicators at bottom ──
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 48),
                child: splashState.status.whenOrNull(
                  initial: () => const SizedBox.shrink(),
                  isLoading: () =>
                      const CircularProgressIndicator(color: Colors.white),
                  success: () => const SizedBox.shrink(),
                  error: () => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: 64,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        splashState.errorMessage ?? 'Something went wrong',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
