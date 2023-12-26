import 'package:get/get.dart';

import '../view/home_view.dart';
import 'base_view_controller.dart';

class TermOfUseViewController extends BaseViewController {
  final isChecked = false.obs;

  void onPressNext() {
    sharedPrefRepository.putHasAgreed(agree: isChecked());
    Get.offAll(const HomeView());
  }
}
