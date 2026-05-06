// splash/viewmodel/splash_viewmodel.dart
import 'dart:ui';

import 'package:flutter_riverpod/legacy.dart';
import 'package:vpn_app/core/extension/state_extension.dart';
import '../model/splash_state.dart';

class SplashViewModel extends StateNotifier<SplashState> {
  SplashViewModel() : super(const SplashState());

  Future<void> init({required VoidCallback onSuccess}) async {
    try {
      state = state.copyWith(status: State.isLoading);

      await Future.delayed(const Duration(seconds: 2));

      state = state.copyWith(status: State.success);

      onSuccess(); // 🔁 Navigate from view, not viewmodel
    } catch (e) {
      state = state.copyWith(status: State.error, errorMessage: e.toString());
    }
  }
}

final splashViewModelProvider =
    StateNotifierProvider<SplashViewModel, SplashState>(
      (ref) => SplashViewModel(),
    );
