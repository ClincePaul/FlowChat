import 'package:flowchat/features/auth/presentation/viewmodel/onboard/onboard_state.dart';
import 'package:flowchat/features/auth/presentation/viewmodel/onboard/onboard_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final onboardingViewModelProvider =
    NotifierProvider.autoDispose<OnboardingViewModel, OnboardingState>(
  OnboardingViewModel.new,
);