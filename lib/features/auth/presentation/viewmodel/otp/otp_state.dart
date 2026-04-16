class OtpState {
  final int secondsRemaining;
  final bool canResend;

  const OtpState({
    required this.secondsRemaining,
    required this.canResend,
  });

  factory OtpState.initial() {
    return const OtpState(
      secondsRemaining: 60,
      canResend: false,
    );
  }

  OtpState copyWith({
    int? secondsRemaining,
    bool? canResend,
  }) {
    return OtpState(
      secondsRemaining: secondsRemaining ?? this.secondsRemaining,
      canResend: canResend ?? this.canResend,
    );
  }
}