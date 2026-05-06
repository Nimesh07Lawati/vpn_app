import 'package:flutter/material.dart';

enum State { initial, isLoading, success, error }

extension StateExtension on State {
  Widget whenOrNull({
    Widget Function()? initial,
    Widget Function()? isLoading,
    Widget Function()? success,
    Widget Function()? error,
  }) {
    switch (this) {
      case State.initial:
        return initial?.call() ?? Container();
      case State.isLoading:
        return isLoading?.call() ?? Container();
      case State.success:
        return success?.call() ?? Container();
      case State.error:
        return error?.call() ?? Container();
    }
  }
}
