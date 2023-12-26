import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:smart_fit/model/body_part_summary.dart';
import 'package:smart_fit/model/gym_detail.dart';
import 'package:smart_fit/model/machine_summary.dart';
import 'package:smart_fit/ui/controller/base_view_controller.dart';

class MachineSelectionViewController extends BaseViewController {
  MachineSelectionViewController({this.bodyPartId});

  final int? bodyPartId;

  final RxList<MachineSummary> machines =  <MachineSummary>[].obs;

  @override
  void onInit() {
    super.onInit();
    apiCall();
  }

  Future<void> apiCall() async {
    await callAsyncApi(() async {
      machines.value = await api.getMachines(); // TODO: APIを叩く時にホーム画面から引数で渡されたIdを渡す必要あり
    });
  }
}
