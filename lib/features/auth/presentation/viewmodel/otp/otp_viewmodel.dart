import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'otp_state.dart';

class OtpViewModel extends Notifier<OtpState> {
  Timer? _timer;

  @override
  OtpState build() {
    startTimer();

    ref.onDispose(() {
      _timer?.cancel();
    });

    return OtpState.initial();
  }

  void startTimer() {
    _timer?.cancel();

    state = OtpState.initial();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.secondsRemaining == 0) {
        timer.cancel();
        state = state.copyWith(canResend: true);
      } else {
        state = state.copyWith(secondsRemaining: state.secondsRemaining - 1);
      }
    });
  }

  void resendOtp() {
    // 🔥 Call API here if needed
    startTimer();
  }

  bool verifyOtp(String otp) {
    return true;
  }
}
