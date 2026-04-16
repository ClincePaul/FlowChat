import 'package:flowchat/features/auth/presentation/viewmodel/otp/otp_state.dart';
import 'package:flowchat/features/auth/presentation/viewmodel/otp/otp_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final otpProvider =
    NotifierProvider.autoDispose<OtpViewModel, OtpState>(
  OtpViewModel.new,
);
