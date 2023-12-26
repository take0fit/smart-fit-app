import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_fit/constant/app_strings.dart';
import 'package:smart_fit/model/body_part.dart';
import 'package:smart_fit/ui/controller/body_part_tab_view_controller.dart';
import 'package:smart_fit/ui/view/machine_selection_view.dart';
import 'package:smart_fit/ui/widget/smart_fit_scaffold.dart';

class BodyPartTabView extends StatelessWidget {
  const BodyPartTabView({super.key});

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 9,
      child: SmartFitScaffold(
        title: Strings.partSelection,
        bottoms: TabBar(
          labelColor: Colors.black,
          isScrollable: true,
          indicatorColor: Colors.black.withOpacity(0.5),
          indicatorWeight: 9,
          tabs: const [
            Tab(text: Strings.favorite),
            Tab(text: Strings.chest),
            Tab(text: Strings.back),
            Tab(text: Strings.shoulder),
            Tab(text: Strings.leg),
            Tab(text: Strings.arm),
            Tab(text: Strings.abs),
            Tab(text: Strings.other),
            Tab(text: Strings.other),
          ],
        ),
        body: TabBarView(
          children: [
            MachineSelectionView(),
            MachineSelectionView(bodyPartId: BodyPart.chestId),
            MachineSelectionView(bodyPartId: BodyPart.backId),
            MachineSelectionView(bodyPartId: BodyPart.shoulderId),
            MachineSelectionView(bodyPartId: BodyPart.legId),
            MachineSelectionView(bodyPartId: BodyPart.armId),
            MachineSelectionView(bodyPartId: BodyPart.absId),
            MachineSelectionView(bodyPartId: BodyPart.otherId),
            DefaultTabController(
              length: 3, // number of tabs
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch, // stretch the tab bar horizontally
                mainAxisAlignment: MainAxisAlignment.center, // center the tab bar vertically
                children: const [
                  TabBar(
                    tabs: <Widget>[
                      Tab(text: 'Tab 1'),
                      Tab(text: 'Tab 2'),
                      Tab(text: 'Tab 3'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: <Widget>[
                        // tab views
                        MachineSelectionView(bodyPartId: BodyPart.chestId),
                        MachineSelectionView(bodyPartId: BodyPart.backId),
                        MachineSelectionView(bodyPartId: BodyPart.shoulderId),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
