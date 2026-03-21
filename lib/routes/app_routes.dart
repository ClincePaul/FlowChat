import 'package:flowchat/features/auth/presentation/view/onboarding_screen.dart';
import 'package:flowchat/features/auth/presentation/view/sign_up_screen.dart';
import 'package:flowchat/routes/transitions/zoom_in_transition.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/view/splash_screen.dart';
import 'route_paths.dart';

//reason for choosing go router is because Role-based navigation. other methodes it is harder, also it supports deeplinking 
class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: RoutePaths.splash,

    routes: [
      GoRoute(
        path: RoutePaths.splash,
       pageBuilder: (context, state) => Zoomintransition.zoom(const SplashScreen() , state),
       // builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: RoutePaths.onboarding,
       pageBuilder: (context, state) => Zoomintransition.zoom(const OnboardingScreen(), state),
      ),
      GoRoute(
        path: RoutePaths.signup,
       pageBuilder: (context, state) => Zoomintransition.zoom(const SignUpScreen(), state),
      ),
      // GoRoute(
      //   path: RoutePaths.dashboard,
      //   builder: (context, state) => const DashboardScreen(),
      // ),
    ],
  );
}