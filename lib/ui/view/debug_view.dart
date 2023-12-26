import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_fit/constant/app_strings.dart';
import 'package:smart_fit/ui/view/body_part_tab_view.dart';
import 'package:smart_fit/ui/widget/smart_fit_scaffold.dart';

import '../controller/debug_view_controller.dart';

class DebugView extends StatelessWidget {
  const DebugView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DebugViewController());
    return SmartFitScaffold(
      title: Strings.debugMenu,
      body: _DebugView(),
    );
  }
}

class _DebugView extends GetView<DebugViewController> {
  @override
  Widget build(BuildContext context) {
    final menus = <DebugMenuData>[
      DebugMenuData(
        title: 'マシン選択画面へ',
        onTap: () => Get.to(const BodyPartTabView()),
      ),
    ];

    return ListView.separated(
      itemBuilder: (context, index) {
        final item = menus[index];
        return ListTile(
          title: Text(item.title),
          subtitle: item.subTitle == null ? null : Text(item.subTitle!),
          onTap: item.onTap,
        );
      },
      separatorBuilder: (_, __) => const Divider(),
      itemCount: menus.length,
    );
  }
}

class DebugMenuData {
  DebugMenuData({
    required this.title,
    this.subTitle,
    required this.onTap,
  });

  String title;
  String? subTitle;
  VoidCallback onTap;
}
