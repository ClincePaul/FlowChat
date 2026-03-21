enum StartupRoute { onboarding, signIn, dashboard }

class AppStartupUseCase {
  Future<StartupRoute> execute() async {
    await Future.delayed(const Duration(seconds: 3));

    // TEMP: Always go to dashboard
    // Later: Add real logic (auth + first time)
    return StartupRoute.onboarding;
  }
}
