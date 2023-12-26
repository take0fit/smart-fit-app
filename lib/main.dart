import 'package:smart_fit/firebase_options.dart';
import 'package:smart_fit/model/app_config.dart';
import 'package:smart_fit/model/app_flavor.dart';
import 'package:smart_fit/run.dart';

void main() => run(
  AppConfig(
    flavor: AppFlavor.production,
    firebaseOptions: DefaultFirebaseOptions.currentPlatform,
    androidPackageName: 'com.example.smart_fit',
    iOSBundleId: 'com.example.smartFit',
  ),
);
