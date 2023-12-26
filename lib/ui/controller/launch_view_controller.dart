import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:smart_fit/ui/controller/base_view_controller.dart';

import '../view/home_view.dart';
import '../view/terms_of_use_view.dart';

class LaunchViewController extends BaseViewController with StateMixin<void> {
  @override
  void onReady() {
    initializeApp();
  }

  Future<void> initializeApp() async {
    try {
      await authService.getCurrentUser()?.reload();
      Get.log(authService.getCurrentUser()?.uid ?? 'no uID');
      await dispatchFirstView();
      change(null, status: RxStatus.success());
    } on FirebaseException catch (e) {
      if (e.code == 'network-request-failed') {
        change(null, status: RxStatus.error(e.message));
      } else {
        change(null, status: RxStatus.error());
        unawaited(FirebaseCrashlytics.instance.recordError(
          e,
          e.stackTrace,
          fatal: true,
          reason: e.toString(),
        ));
      }
    } on Exception catch (e) {
      change(null, status: RxStatus.error());
      unawaited(FirebaseCrashlytics.instance.recordError(
        e,
        StackTrace.current,
        fatal: true,
        reason: e.toString(),
      ));
    } finally {
      FlutterNativeSplash.remove();
    }
  }

  Future<void> dispatchFirstView() async {
    if (sharedPrefRepository.getHasAgreed() != true) {
      unawaited(Get.offAll(const TermsOfUseView()));
      return;
    }

    //初期設定が完了していなかったら
    // TODO(yu1ro): 会員登録をつなぎこみ次第、未登録の場合に初期設定画面へ
    // TODO(yu1ro): 003画面ができ次第変更
    // Get.to(const InitialSettingBeauticianView());

    unawaited(Get.offAll(const HomeView()));
  }
}
