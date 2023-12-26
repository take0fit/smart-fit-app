import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_fit/service/api_service.dart';
import 'package:smart_fit/service/authentication_service.dart';
import 'package:smart_fit/service/firestore_service.dart';
import 'package:smart_fit/service/shared_preference_repository.dart';

import 'model/app_config.dart';

Future<void> setupLocator(AppConfig config) async {
  // 依存オブジェクトをlazy（怠惰な、消極的な、遅延）ロードしてくれる
  // Get.findが最初に呼び出されて初めてメモリにロードされる
  Get
    ..lazyPut(() => config, fenix: true)
    ..lazyPut(ApiService.new, fenix: true)
    ..lazyPut(FirestoreService.new, fenix: true)
    ..lazyPut(AuthenticationService.new, fenix: true);

  // SharedPreferencesやデータベース関連のパッケージを使用するとOSのストレージと接続するため、依存関係を非同期的に処理する必要がある
  // Get.putAsyncを使用することで依存関係を非同期的に処理することができる
  await Get.putAsync(
    permanent: true,
    () async {
      await Get.putAsync(
        // セッション全体で依存オブジェクトをメモリに保持したい場合は permanent プロパティを使用
        // Navigationのスタックから削除されてもdisposeされないように
        permanent: true,
        // SharedPreferencesはプラットフォーム固有の永続的ストレージに一時的にデータを保存するプラグイン
        () async => SharedPreferences.getInstance(),
      );
      final preferences = Get.find<SharedPreferences>();
      return SharedPreferenceRepository(preferences);
    },
  );
}
