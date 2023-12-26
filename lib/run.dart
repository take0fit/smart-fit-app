import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:smart_fit/ui/common/app_color.dart';
import 'package:smart_fit/ui/view/launch_view.dart';

import 'locator.dart';
import 'model/app_config.dart';

void run(AppConfig config) {
  // runZonedGuardedでrunAppなどを囲んで新たなエラーゾーンを定義した上で、
  // FirebaseCrashlytics.instance.recordErrorで記録するクラッシュハンドラ
  runZonedGuarded<Future<void>>(() async {
    // WidgetsFlutterBindingはフレームワークとFlutterエンジンを結びつける接着剤のような役割
    final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    await Future.wait([
      setupLocator(config),
      Firebase.initializeApp(options: config.firebaseOptions),
    ]);

    // クラッシュハンドラ(Flutterフレームワーク内でスローされたすべてのエラー)
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    runApp(const MyApp());
  },
      // クラッシュハンドラ(Flutterフレームワーク内でキャッチされないエラー)
      (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack, fatal: true));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // FlutterでGetXの機能を使うためにはMaterialApp代わりにGetMaterialAppを使う必要がある
    return GetMaterialApp(
      title: 'Flutter Demo',
      supportedLocales: const [Locale('ja', 'JP')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        // cupertinoOverrideTheme: const NoDefaultCupertinoThemeData(barBackgroundColor: Colors.white),
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
        // primaryColor: primaryColor,
        // appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
        // scaffoldBackgroundColor: Colors.white,
        floatingActionButtonTheme: Theme.of(context).floatingActionButtonTheme.copyWith(
              backgroundColor: primaryColor,
            ),
        checkboxTheme: Theme.of(context).checkboxTheme.copyWith(
          fillColor: MaterialStateProperty.resolveWith((states) {
            const interactiveStates = {
              MaterialState.selected,
            };
            if (states.any(interactiveStates.contains)) {
              return primaryColor;
            }
            return outlineColor;
          }),
        ),
        radioTheme: Theme.of(context).radioTheme.copyWith(
          fillColor: MaterialStateProperty.resolveWith((states) {
            const interactiveStates = {
              MaterialState.selected,
            };
            if (states.any(interactiveStates.contains)) {
              return primaryColor;
            }
            return Theme.of(context).disabledColor;
          }),
        ),
        // colorScheme: Theme.of(context)
        //     .colorScheme
        //     .copyWith(primary: primaryColor)
        //     .copyWith(secondary: secondaryColor)
        //     .copyWith(background: backgroundColor),
      ),
      home: const LaunchView(),
    );
  }
}
