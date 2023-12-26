import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_fit/ui/controller/machine_selection_view_controller.dart';

class MachineSelectionView extends StatelessWidget {
  const MachineSelectionView({super.key, this.bodyPartId});

  final int? bodyPartId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MachineSelectionViewController(bodyPartId: bodyPartId));
    return Scaffold(
      body: Obx(
        () => GridView.count(
            crossAxisCount: 2,
            children: controller.machines
                .map(
                  (element) => Text(element.name),
                )
                .toList()),
      ),
    );
  }
}
