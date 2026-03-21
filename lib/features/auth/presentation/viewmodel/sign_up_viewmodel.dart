import 'package:flowchat/core/utils/validators.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'sign_up_state.dart';

final signUpProvider =
    StateNotifierProvider<SignUpNotifier, SignUpState>(
  (ref) => SignUpNotifier(),
);

class SignUpNotifier extends StateNotifier<SignUpState> {
  SignUpNotifier() : super(const SignUpState());

  void onEmailChanged(String value) {
    final error = Validators.validateEmail(value);

    state = state.copyWith(
      email: value,
      emailError: error,
    );
  }

  void onUsernameChanged(String value) {
    final error = Validators.validateUsername(value);
    state = state.copyWith(
      username: value,
      userNameError: error
      );
  }
}