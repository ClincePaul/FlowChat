import 'package:flowchat/features/auth/presentation/viewmodel/sign_up_step_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signUpStepProvider =
    NotifierProvider<SignUpStepViewModel, SignUpStep>(
  SignUpStepViewModel.new,
);

