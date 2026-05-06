import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vpn_app/core/extension/state_extension.dart';
import 'package:vpn_app/features/splash/viewmodel/splash_view_model.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});
  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Trigger init after first frame so context is ready
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
  Widget build(BuildContext context) {
    final splashState = ref.watch(splashViewModelProvider);

    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/app_images/background.png',
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
                alignment: const Alignment(0.0, 0.0),
              ),
            ),
            Positioned.fill(
              child: Container(color: Colors.black.withValues(alpha: 0.3)),
            ),
            Align(
              alignment: Alignment.bottomCenter,
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
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
