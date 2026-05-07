import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vpn_app/core/routes/appRoutes.dart';
import 'flavors.dart';

class App extends ConsumerWidget {
  // ← change to ConsumerWidget
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider); // ← watch the router

    return MaterialApp.router(
      // ← use MaterialApp.router
      title: F.title,
      theme: ThemeData(primarySwatch: Colors.blue),
      routerConfig: router, // ← pass router here
      builder: kDebugMode
          ? (context, child) => Banner(
              location: BannerLocation.topStart,
              message: F.name,
              color: Colors.green.withAlpha(150),
              textStyle: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 12.0,
                letterSpacing: 1.0,
              ),
              textDirection: TextDirection.ltr,
              child: child!,
            )
          : null,
    );
  }
}
