import 'package:flowchat/core/errors/exceptions/network_exception.dart';
import 'package:flowchat/core/services/network_info_service.dart';
import 'package:flowchat/core/shared/domain/service/url_service.dart';
import 'package:url_launcher/url_launcher.dart';
import '../errors/exceptions/url_launch_exception.dart';

class UrlLauncherService implements UrlService {
  final NetworkInfo networkInfo;

  UrlLauncherService(this.networkInfo);

  @override
  Future<void> openUrl(String url) async {
    if (!await networkInfo.isConnected) {
      throw const NetworkException("no_internet");
    }

    final uri = Uri.parse(url);

    final success = await launchUrl(uri, mode: LaunchMode.inAppBrowserView);

    if (!success) {
      throw const UrlLaunchException("url_launch_failed");
    }
  }
}
