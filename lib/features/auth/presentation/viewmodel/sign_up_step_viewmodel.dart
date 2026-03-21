import 'package:flutter_riverpod/legacy.dart';

enum SignUpStep { email, otp, profile }

class SignUpStepNotifier extends StateNotifier<SignUpStep> {
  SignUpStepNotifier() : super(SignUpStep.email);

  void goToOtp() {
    state = SignUpStep.otp;
  }

  void goToProfile() {
    state = SignUpStep.profile;
  }

  void back() {
    if (state == SignUpStep.otp) {
      state = SignUpStep.email;
    } else if (state == SignUpStep.profile) {
      state = SignUpStep.otp;
    }
  }
}

final signUpStepProvider =
    StateNotifierProvider<SignUpStepNotifier, SignUpStep>(
  (ref) => SignUpStepNotifier(),
);