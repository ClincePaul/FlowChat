import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flowchat/core/services/network_info_service.dart';
import 'package:flowchat/core/shared/domain/service/url_service.dart';
import 'package:flowchat/core/services/url_launcher_service.dart';

/// 🌐 Connectivity
final connectivityProvider = Provider<Connectivity>((ref) {
  return Connectivity();
});

/// 📡 Network Info
final networkInfoProvider = Provider<NetworkInfo>((ref) {
  return NetworkInfo(ref.read(connectivityProvider));
});

/// 🔗 URL Service
final urlServiceProvider = Provider<UrlService>((ref) {
  return UrlLauncherService(ref.read(networkInfoProvider));
});