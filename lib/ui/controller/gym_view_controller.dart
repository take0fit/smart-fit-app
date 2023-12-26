import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:smart_fit/model/gym_detail.dart';
import 'package:smart_fit/ui/controller/base_view_controller.dart';

class GymViewController extends BaseViewController {
  GymViewController(this.gymId);

  final int gymId;
  RxInt activeIndex = 0.obs;
  final gym = Rxn<GymDetail>();

  @override
  void onInit() {
    super.onInit();
    apiCall();
  }

  Future<void> apiCall() async {
    await callAsyncApi(() async {
      gym.value = await api.getGym(); // TODO(takahashi): APIを叩く時にホーム画面から引数で渡されたIdを渡す必要あり
    });
  }

  Future<void> onTapFavorite() async {} // TODO(thashish): onTapFavorite実装時に処理を追加する必要あり
}
