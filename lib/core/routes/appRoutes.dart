// core/router/app_router.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vpn_app/core/widgets/app_shell.dart';
import 'package:vpn_app/features/auth/signup_screen.dart';
import 'package:vpn_app/features/home/presentation/home_screen.dart';
import 'package:vpn_app/features/auth/logiin_screen.dart';
import 'package:vpn_app/features/profile/profile_screen.dart';
import 'package:vpn_app/features/servers/server_screen.dart';
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
            pageBuilder: (context, state) =>
                _slidePage(key: state.pageKey, child: const SplashScreen()),
          ),
          GoRoute(
            path: '/login',
            name: 'login',
            pageBuilder: (context, state) =>
                _slidePage(key: state.pageKey, child: const LoginScreen()),
          ),
          GoRoute(
            path: '/signup',
            name: 'signup',
            pageBuilder: (context, state) =>
                _slidePage(key: state.pageKey, child: const SignUpScreen()),
          ),
        ],
      ),
      // ─── Home — no shell, has its own background ───
      GoRoute(
        path: '/home',
        name: 'home',
        pageBuilder: (context, state) =>
            _slidePage(key: state.pageKey, child: const HomeScreen()),
      ),
      GoRoute(
        path: '/profile',
        name: 'profile',
        pageBuilder: (context, state) =>
            _slidePage(key: state.pageKey, child: const ProfileScreen()),
      ),
      GoRoute(
        path: '/server',
        name: 'server',
        pageBuilder: (context, state) => _slidePage(
          key: state.pageKey,
          child: const ServerSelectionScreen(),
        ),
      ),
    ],
  );
});

CustomTransitionPage<void> _slidePage({
  required LocalKey key,
  required Widget child,
}) {
  return CustomTransitionPage<void>(
    key: key,
    child: child,
    transitionDuration: const Duration(milliseconds: 350),
    reverseTransitionDuration: const Duration(milliseconds: 350),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      final tween = Tween(
        begin: begin,
        end: end,
      ).chain(CurveTween(curve: curve));

      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );
}
