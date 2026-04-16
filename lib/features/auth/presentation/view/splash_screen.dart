import 'package:flowchat/core/constants/app_assets.dart';
import 'package:flowchat/core/utils/tr.dart';
import 'package:flowchat/features/auth/domain/usecase/app_startup_usecase.dart';
import 'package:flowchat/features/auth/presentation/viewmodel/splash_viewmodel.dart';
import 'package:flowchat/routes/route_paths.dart';
import 'package:flowchat/theme/base/app_padding.dart';
import 'package:flowchat/theme/base/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final SplashViewModel _viewModel;

  @override
  void initState() {
    super.initState();

    _viewModel = SplashViewModel(AppStartupUseCase());

    _start();
  }

  Future<void> _start() async {
  final route = await _viewModel.decideRoute();

  if (!mounted) return;

  switch (route) {
    case StartupRoute.dashboard:
      context.go(RoutePaths.dashboard);
      break;

    case StartupRoute.onboarding:
      context.go(RoutePaths.onboarding);
      break;
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppPadding.screenPadding,
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Image.asset(AppAssets.appIconText, width: 270),
              ),
            ),
        
            Consumer(
              builder: (context, ref, child) {
                return Text(
                  tr(context, "spl_txt1"),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                );
              },
            ),
        
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.lg),
              child: Consumer(
                builder: (context, ref, child) {
                  return Text(
                    tr(context , "spl_txt2"),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
