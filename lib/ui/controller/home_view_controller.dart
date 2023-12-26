import 'dart:async';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:smart_fit/model/gym_summary.dart';
import 'package:smart_fit/model/member_type.dart';
import 'package:smart_fit/ui/controller/base_view_controller.dart';
import 'package:smart_fit/ui/view/debug_view.dart';
import 'package:smart_fit/ui/view/gym_view.dart';
import 'package:smart_fit/ui/view/machine_selection_view.dart';

class HomeViewController extends BaseViewController {
  final Rxn<MemberType> memberType = Rxn<MemberType>();
  final RxInt tabIndex = 0.obs;
  final RxInt imageIndicatorIndex = 0.obs;
  final RxList<String> images = <String>[].obs;
  final RxBool visible = false.obs;
  final RxInt unreadNotificationCount = 0.obs;
  final RxList<GymSummary> contractedGyms =  <GymSummary>[].obs;
  final RxList<GymSummary> recommendedGyms =  <GymSummary>[].obs;
  final RxList<GymSummary> favoriteGyms =  <GymSummary>[].obs;


  final CarouselController imageCarouselController = CarouselController();

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    await callAsyncApi(() async {
      await Future.wait([
        () async {
          images.value = await api.getHomeImages();
        }(),
        () async {
          contractedGyms.value = await api.getContractedGyms();
        }(),
        () async {
          recommendedGyms.value = await api.getRecommendedGyms();
        }(),
        () async {
          favoriteGyms.value = await api.getFavoriteGyms();
        }(),
      ]);
      visible.value = true;
    });
  }

  void onTapBottomNavigation(int index) {
    if (index == 1) {
      toMyPage();
    } else if (index == 2) {
      toChekInGym();
    }
  }

  void toGym(int id) {
    Get.to(GymView(gymId: id));
  }

  Future<void> onTapFavorite() async {} // TODO(thashish): onTapFavorite実装時に処理を追加する必要あり

  void toChekInGym() {
    Get.to(MachineSelectionView());
  }

  void toDebug() {
    Get.to(const DebugView());
  }

  void toLogin() {
    // TODO: 遷移
  }

  void logout() {
    // TODO: 遷移
  }

  void toMyPage() {
    // TODO: 遷移
  }

  void toNotification() {
    // TODO: 遷移
  }
}
