// import 'dart:io';
// import 'package:flowchat/routes/app_routes.dart';
// import 'package:flowchat/theme/app_theme.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   // Enable modern edge-to-edge layout
//   if (!Platform.isWindows) {
//     //await Firebase.initializeApp();
//   }
//   //   await Firebase.initializeApp(
//   //   options: DefaultFirebaseOptions.currentPlatform,
//   // );

//   //SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge); //this will show bottom and top navi bar

//   SystemChrome.setEnabledSystemUIMode(
//   SystemUiMode.immersiveSticky,
// );

//  // registerCoreDependencies();
//   runApp(const ProviderScope(child: MyApp()));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       debugShowCheckedModeBanner: false,
//       title: 'Flow Chat',
//       theme: AppTheme.lightTheme,
//       darkTheme: AppTheme.darkTheme,
//       themeMode: ThemeMode.system, // only this
//       routerConfig: AppRouter.router,
//       // builder: (context, child) {
//       //   return SafeArea(
//       //     top: false,
//       //     bottom: true,
//       //     child: child ?? const SizedBox(),
//       //   );
//       // },
//       builder: (context, child) {
//         final brightness = Theme.of(context).brightness;
//         final isDark = brightness == Brightness.dark;

//         SystemChrome.setSystemUIOverlayStyle(
//           SystemUiOverlayStyle(
//             statusBarColor: Colors.transparent, // top
//             statusBarIconBrightness: isDark
//                 ? Brightness.light
//                 : Brightness.dark,

//             systemNavigationBarColor: isDark
//                 ? Colors.black
//                 : Colors.white, // bottom
//             systemNavigationBarIconBrightness: isDark
//                 ? Brightness.light
//                 : Brightness.dark,
//           ),
//         );

//         return child ?? const SizedBox();
//       },
//     );
//   }
// }

import 'dart:io';
import 'package:flowchat/routes/app_routes.dart';
import 'package:flowchat/theme/app_theme.dart';
import 'package:flowchat/core/state/language/language_change_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!Platform.isWindows) {
    // await Firebase.initializeApp();
  }
  //   //   await Firebase.initializeApp(
  //   //   options: DefaultFirebaseOptions.currentPlatform,
  //   // );
  //   //SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge); //this will show bottom and top navi bar
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final langCode = ref.watch(localeProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flow Chat',

      // 🔥 CONNECT RIVERPOD HERE
      locale: Locale(langCode),
      supportedLocales: const [Locale('en'), Locale('ml'), Locale('hi'),Locale('ta')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      // theme: AppTheme.lightTheme,
      // darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme(Locale(langCode)),
      darkTheme: AppTheme.darkTheme(Locale(langCode)),
      themeMode: ThemeMode.system,
      routerConfig: AppRouter.router,

      builder: (context, child) {
        final brightness = Theme.of(context).brightness;
        final isDark = brightness == Brightness.dark;

        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: isDark
                ? Brightness.light
                : Brightness.dark,
            systemNavigationBarColor: isDark ? Colors.black : Colors.white,
            systemNavigationBarIconBrightness: isDark
                ? Brightness.light
                : Brightness.dark,
          ),
        );

        return child ?? const SizedBox();
      },
    );
  }
}
