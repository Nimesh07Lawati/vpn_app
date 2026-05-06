import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
        ],
      ),
    );
  }
}
