import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flowchat/core/services/network_info_service.dart';
import 'package:flowchat/core/shared/domain/service/url_service.dart';
import 'package:flowchat/features/auth/presentation/viewmodel/onboard_viewmodel.dart';
import 'package:get_it/get_it.dart';
import '../core/services/url_launcher_service.dart';

final sl = GetIt.instance;

void registerCoreDependencies() {
  // registerLazySingleton
  // The object is created ONLY when it is requested for the first time.
  // After that, the same instance is reused everywhere in the app.
  // This helps avoid unnecessary memory usage until the service is actually needed.

  // registerSingleton
  // The object is created immediately at the time of registration
  // (usually when the app starts or when DI setup runs).
  // The same instance is reused everywhere in the app.
  // Disadvantage: Even if the object is never used, it still consumes memory
  // because it is created eagerly at startup.

  // registerFactory
  // A new instance is created every time it is requested from GetIt.
  // No instance is reused.
  // Useful for classes like ViewModels or Controllers where you want
  // a fresh object each time and avoid shared state issues.

  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton(() => NetworkInfo(sl()));

  sl.registerLazySingleton<UrlService>(() => UrlLauncherService(sl<NetworkInfo>()));

  sl.registerFactory<OnboardingViewModel>(
    () => OnboardingViewModel(sl<UrlService>()),
  );
}
