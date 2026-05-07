// lib/features/vpn/widgets/vpn_button.dart
import 'package:flutter/material.dart';

class VPNButton extends StatelessWidget {
  final bool isConnected;
  final VoidCallback onTap;

  const VPNButton({super.key, required this.isConnected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 180,
        height: 180,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isConnected
                ? [Colors.green.shade400, Colors.green.shade700]
                : [
                    Colors.white.withValues(alpha: 0.3),
                    Colors.white.withValues(alpha: 0.1),
                  ],
          ),
          boxShadow: [
            BoxShadow(
              color: (isConnected ? Colors.green : Colors.white).withValues(
                alpha: 0.3,
              ),
              blurRadius: 30,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withValues(alpha: 0.1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isConnected ? Icons.power_settings_new : Icons.power_off,
                color: Colors.white,
                size: 60,
              ),
              const SizedBox(height: 12),
              Text(
                isConnected ? 'CONNECTED' : 'CONNECT',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
