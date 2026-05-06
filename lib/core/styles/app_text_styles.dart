import 'package:flutter/material.dart';

class AppTextStyles {
  // Title
  static const TextStyle heading = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 0.5,
  );

  // Subtitle
  static TextStyle subtitle = TextStyle(
    fontSize: 16,
    color: Colors.white.withOpacity(0.8),
  );

  // Input text
  static const TextStyle inputText = TextStyle(color: Colors.white);

  // Hint text
  static TextStyle hintText = TextStyle(color: Colors.white.withOpacity(0.6));

  // Button text
  static const TextStyle buttonText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  // Link text
  static TextStyle link = TextStyle(
    color: Colors.white.withOpacity(0.9),
    fontWeight: FontWeight.w500,
  );

  // Small faded text
  static TextStyle small = TextStyle(color: Colors.white.withOpacity(0.8));

  // Divider text (OR)
  static TextStyle divider = TextStyle(
    color: Colors.white.withOpacity(0.7),
    fontWeight: FontWeight.w500,
  );

  // Bold link (Sign up)
  static const TextStyle boldLink = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline,
  );
}
