import 'package:flowchat/features/auth/presentation/viewmodel/profile/profile_state.dart';
import 'package:flowchat/features/auth/presentation/viewmodel/profile/profile_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileViewModelProvider =
    NotifierProvider<ProfileViewModel, ProfileState>(ProfileViewModel.new);
