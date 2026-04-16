import 'package:flowchat/features/auth/presentation/viewmodel/sign_up/sign_up_state.dart';
import 'package:flowchat/features/auth/presentation/viewmodel/sign_up/sign_up_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signUpProvider =
    NotifierProvider<SignUpViewModel, SignUpState>(
  SignUpViewModel.new,
);