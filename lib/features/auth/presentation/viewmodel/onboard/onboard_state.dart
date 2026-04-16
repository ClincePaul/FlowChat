class OnboardingState {
  final int index;
  final bool isOpeningLink;

  const OnboardingState({
    this.index = 0,
    this.isOpeningLink = false,
  });

  OnboardingState copyWith({
    int? index,
     bool? isOpeningLink,
  }) {
    return OnboardingState(
      index: index ?? this.index,
      isOpeningLink: isOpeningLink ?? this.isOpeningLink,
    );
  }
}