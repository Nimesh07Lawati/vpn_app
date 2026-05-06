// splash/model/splash_state.dart
import 'package:vpn_app/core/extension/state_extension.dart';

class SplashState {
  final State status;
  final String? errorMessage;

  const SplashState({this.status = State.initial, this.errorMessage});

  SplashState copyWith({State? status, String? errorMessage}) {
    return SplashState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
