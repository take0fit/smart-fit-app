class PrefKeys {
  // ._()->1度だけインスタンスされる特殊なコンストラクタ
  // instance変数は不要
  PrefKeys._() {
    throw AssertionError('private constructor');
  }

  static const termOfUseAppAgree = 'termOfUseAppAgree';
}
