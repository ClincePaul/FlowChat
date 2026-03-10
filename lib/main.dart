import 'package:flowchat/routes/app_routes.dart';
import 'package:flowchat/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
  // Enable modern edge-to-edge layout
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flow Chat',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // only this
      routerConfig: AppRouter.router,
      builder: (context, child) {
        return SafeArea(
          top: true,                 
          bottom: true,
          child: child ?? const SizedBox(),
        );
      },
    );
  }
}
