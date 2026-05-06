// core/router/app_router.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vpn_app/core/widgets/app_shell.dart';
import 'package:vpn_app/features/auth/signup_screen.dart';
import 'package:vpn_app/features/home/presentation/home_screen.dart';
import 'package:vpn_app/features/auth/logiin_screen.dart';
import 'package:vpn_app/features/splash/presentation/splash_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) => AppShell(child: child),
        routes: [
          GoRoute(
            path: '/',
            name: 'splash',
            builder: (context, state) => const SplashScreen(),
          ),
          GoRoute(
            path: '/login',
            name: 'login',
            builder: (context, state) => const LoginScreen(),
          ),
          GoRoute(
            path: '/signup',
            name: 'signup',
            builder: (context, state) => const SignUpScreen(),
          ),
        ],
      ),

      // ─── Home — no shell, has its own background ───
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) =>
            const HomeScreen(), // 👈 default transition
      ),
    ],
  );
});
