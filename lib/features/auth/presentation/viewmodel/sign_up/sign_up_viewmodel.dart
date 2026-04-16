import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flowchat/core/utils/validators.dart';
import 'sign_up_state.dart';

class SignUpViewModel extends Notifier<SignUpState> {
  @override
  SignUpState build() {
    return const SignUpState();
  }

  /// 📧 Email change
  void onEmailChanged(String value) {
    final error = Validators.validateEmail(value);

    state = state.copyWith(
      email: value,
      emailError: error,
    );
  }

  /// 👤 Username change
  void onUsernameChanged(String value) {
    final error = Validators.validateUsername(value);

    state = state.copyWith(
      username: value,
      userNameError: error,
    );
  }
}