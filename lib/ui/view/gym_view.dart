import 'package:carousel_slider/carousel_slider.dart';
import 'package:smart_fit/ui/common/ui_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_fit/ui/controller/gym_view_controller.dart';
import 'package:smart_fit/ui/widget/gym_detail_item.dart';
import 'package:smart_fit/ui/widget/gym_image_item.dart';
import 'package:smart_fit/ui/widget/loading_stack.dart';
import 'package:smart_fit/ui/widget/smart_fit_scaffold.dart';

class GymView extends StatelessWidget {
  const GymView({super.key, required this.gymId});

  final int gymId;

  @override
  Widget build(BuildContext context) {
    Get.put(GymViewController(gymId));
    return const SmartFitScaffold(
      title: "GYM",
      body: _GymView(),
    );
  }
}

class _GymView extends GetView<GymViewController> {
  const _GymView();

  @override
  Widget build(BuildContext context) {
    return GetLoadingStack<GymViewController>(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              return CarouselSlider.builder(
                options: CarouselOptions(
                  initialPage: 0,
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) => controller.activeIndex.value = index,
                ),
                itemCount: controller.gym.value?.imageUrls.length ?? 0,
                itemBuilder: (context, index, realIndex) {
                  final path = controller.gym.value?.imageUrls[index];
                  final isFavorite = controller.gym.value?.isFavorite;
                  return buildImage(path, index, isFavorite);
                },
              );
            }),
            verticalSpaceMedium,
            Obx(() {
              return buildIndicator();
            }),
            verticalSpaceMedium,
            const _GymDetail(),
          ],
        ),
      ),
    );
  }

  Widget buildImage(String? path, index, bool? isFavorite) => Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        //画像間の隙間
        margin: const EdgeInsets.symmetric(horizontal: 13),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: GymImageItem(
            imageUrl: path ??
                "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpolymerdatabase.com%2Funcessant94%2FXURgQAQ4.html&psig=AOvVaw3DhzRGKbvSy1XxDgWOtx2g&ust=1680049571151000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCJCTiMGu_f0CFQAAAAAdAAAAABAE",
            isFavorite: isFavorite ?? false,
            onTapFavorite: () => controller.onTapFavorite(),
            iconSize: 48,
            iconPadding: const EdgeInsets.all(10),
            buttonPadding: const EdgeInsets.all(16),
            height: Get.width * 5 / 6,
            width: Get.width,
          ),
        ),
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: controller.activeIndex.value,
        count: controller.gym.value?.imageUrls.length ?? 1,
        effect: const JumpingDotEffect(
            dotHeight: 20, dotWidth: 20, activeDotColor: Colors.green, dotColor: Colors.black12),
      );
}
//
// class _GymImage extends GetView<GymViewController> {
//   const _GymImage();
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       final gym = controller.gym;
//       if (gym() == null) {
//         return const SizedBox();
//       }
//       return GymImageItem(
//         imageUrl: gym()!.imageUrl,
//         isFavorite: gym()?.isFavorite ?? false,
//         onTapFavorite: () => controller.onTapFavorite(),
//         iconSize: 48,
//         iconPadding: const EdgeInsets.all(10),
//         buttonPadding: const EdgeInsets.all(16),
//         height: Get.width * 3 / 4,
//         width: Get.width,
//       );
//     });
//   }
// }

class _GymDetail extends GetView<GymViewController> {
  const _GymDetail();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final gym = controller.gym;
      if (gym() == null) {
        return const SizedBox();
      }
      return GymDetailItem(
        name: gym()!.name,
        numberOfUsers: gym()!.numberOfUsers,
        address: gym()!.address,
        area: gym()!.area,
        businessHours: gym()!.businessHours,
        monthlyAmount: gym()!.monthlyAmount,
      );
    });
  }
}
