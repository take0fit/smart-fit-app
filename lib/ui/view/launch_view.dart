import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_fit/constant/app_strings.dart';

import '../controller/launch_view_controller.dart';

class LaunchView extends StatelessWidget {
  const LaunchView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LaunchViewController());
    return Scaffold(
      body: controller.obx(
        (_) => const SizedBox(),
        onError: (message) => DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  message ?? Strings.apiError,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: controller.initializeApp,
                  child: const Text(Strings.retry),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
