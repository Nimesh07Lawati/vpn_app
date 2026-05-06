// core/router/app_router.dart
import 'package:go_router/go_router.dart';
import 'package:vpn_app/features/home/presentation/home_screen.dart';
import 'package:vpn_app/features/splash/presentation/splash_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
