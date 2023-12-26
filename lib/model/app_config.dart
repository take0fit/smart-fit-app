import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';

import 'app_flavor.dart';

class AppConfig {
  AppConfig({
    required this.flavor,
    required this.androidPackageName,
    required this.iOSBundleId,
    required this.firebaseOptions,
  });

  final AppFlavor flavor;
  final String androidPackageName;
  final String iOSBundleId;
  final FirebaseOptions firebaseOptions;
}
