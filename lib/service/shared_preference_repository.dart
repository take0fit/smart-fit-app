import 'package:shared_preferences/shared_preferences.dart';

import '../constant/preference_keys.dart';

class SharedPreferenceRepository {
  // コンストラクタのあとの:(コロン)はInitializer listと呼ばれる
  // assert, fieldの初期化, 他のコンストラクタ(super含む)がサポートされていて `,`(カンマ繋ぎで記述できる)
  SharedPreferenceRepository(SharedPreferences preferences) : _preferences = preferences;

  final SharedPreferences _preferences;

  Future<void> putHasAgreed({required bool agree}) async {
    await _preferences.setBool(PrefKeys.termOfUseAppAgree, agree);
  }

  bool? getHasAgreed() {
    return _preferences.getBool(PrefKeys.termOfUseAppAgree);
  }

  Future<void> resetHasAgreed() async {
    await _preferences.remove(PrefKeys.termOfUseAppAgree);
  }
}
