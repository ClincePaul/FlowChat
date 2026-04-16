import 'package:flutter_riverpod/flutter_riverpod.dart';

enum SignUpStep { email, otp, profile }

class SignUpStepViewModel extends Notifier<SignUpStep> {
  @override
  SignUpStep build() {
    return SignUpStep.email;
  }

  /// ➡️ Go to OTP
  void goToOtp() {
    state = SignUpStep.otp;
  }

  /// ➡️ Go to Profile
  void goToProfile() {
    state = SignUpStep.profile;
  }

  /// ⬅️ Back navigation
  void back() {
    if (state == SignUpStep.otp) {
      state = SignUpStep.email;
    } else if (state == SignUpStep.profile) {
      state = SignUpStep.email; // ✅ FIXED (better UX)
    }
  }

  /// 🔄 Reset flow
  void reset() {
    state = SignUpStep.email;
  }
}