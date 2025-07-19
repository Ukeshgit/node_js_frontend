import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nodejs_tut/riverpod_get_post/controller/enum.dart';

class ButtonStateNotifier extends StateNotifier<ButtonStatus> {
  ButtonStateNotifier() : super(ButtonStatus.idle);
  void setLoading() {
    state = ButtonStatus.loading;
  }

  void setIdle() {
    state = ButtonStatus.idle;
  }

  void setSuccess() => ButtonStatus.sucess;
  void setError() => ButtonStatus.error;
}

final buttonProvider = StateNotifierProvider<ButtonStateNotifier, ButtonStatus>(
  (ref) {
    return ButtonStateNotifier();
  },
);
