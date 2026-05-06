// core/widgets/app_shell.dart
import 'package:flutter/material.dart';

class AppShell extends StatelessWidget {
  final Widget child;

  const AppShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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

          child,
        ],
      ),
    );
  }
}
