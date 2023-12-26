import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/app_size.dart';
import '../../constant/app_strings.dart';
import '../common/app_color.dart';
import '../common/ui_helper.dart';
import '../controller/term_of_use_view_controller.dart';
import '../widget/button.dart';
import '../widget/smart_fit_scaffold.dart';
import '../widget/text_with_checkbox.dart';

class TermsOfUseView extends StatelessWidget {
  const TermsOfUseView({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceHeight = context.height;
    final controller = Get.put(TermOfUseViewController());
    return SmartFitScaffold(
      title: Strings.termsOfUse,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: horizontalPaddingNormal),
            child: Text(Strings.termsOfUseDescription),
          ),
          Container(
            color: Colors.white,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            height: deviceHeight * 0.45,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: gray6,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SingleChildScrollView(
                child: Container(
                  height: 600,
                  padding: const EdgeInsets.all(20),
                  child: const Text('ここにテキストが入ります'),
                ),
              ),
            ),
          ),
          const Spacer(),
          Obx(
            () => TextWithCheckbox(
              value: controller.isChecked.value,
              onChanged: (value) {
                controller.isChecked.value = value!;
              },
              title: RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: Strings.termsOfUse,
                      style: TextStyle(color: Get.theme.primaryColor),
                    ),
                    const TextSpan(
                      text: Strings.termsOfUseApproval,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: horizontalPaddingNormal),
            child: Obx(
              () => PrimaryButton(
                label: Strings.startUsing,
                onPressed: controller.onPressNext,
                isValid: controller.isChecked.value,
              ),
            ),
          ),
          verticalSpaceLarge,
        ],
      ),
    );
  }
}
