
import 'package:flowchat/features/auth/domain/usecase/app_startup_usecase.dart';

class SplashViewModel {
  final AppStartupUseCase _startupUseCase;

  SplashViewModel(this._startupUseCase);

  Future<StartupRoute> decideRoute() {
    return _startupUseCase.execute();
  }
}