import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smart_fit/constant/app_strings.dart';
import 'package:smart_fit/constant/text_styles.dart';
import 'package:smart_fit/model/member_type.dart';
import 'package:smart_fit/ui/controller/home_view_controller.dart';
import 'package:smart_fit/ui/widget/gym_summary_item.dart';

import '../common/app_color.dart';
import '../common/ui_helper.dart';
import '../widget/loading_stack.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeViewController());

    return Stack(
      children: [
        GetLoadingStack<HomeViewController>(
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(40),
              child: AppBar(

                centerTitle: true,
                title: const Text("Smart Fit", style: TextStyle(fontSize: 16)),
                actions: [
                  _NotificationAction(),
                  // _MyPageAction(),
                ],
              ),
            ),
            drawer: const _HomeDrawer(),
            body: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: _HomeContent(),
            ),
            bottomNavigationBar: SizedBox(
              height: 55,
              child: Obx(
                () => CupertinoTabBar(
                  onTap: controller.onTapBottomNavigation,
                  currentIndex: controller.tabIndex.value,
                  backgroundColor: Colors.white,
                  items: [
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.all(1),
                        child: SvgPicture.asset(
                          'assets/icons/home.svg',
                          color: iconGreyColor,
                          width: 15,
                          height: 15,
                        ),
                      ),
                      activeIcon: Padding(
                        padding: const EdgeInsets.all(1),
                        child: SvgPicture.asset(
                          'assets/icons/home.svg',
                          color: Get.theme.primaryColor,
                          width: 15,
                          height: 15,
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/icons/qr_code.svg',
                        color: iconGreyColor,
                        width: 15,
                        height: 15,
                      ),
                      activeIcon: SvgPicture.asset(
                        'assets/icons/qr_code.svg',
                        color: Get.theme.primaryColor,
                        width: 15,
                        height: 15,
                      ),
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/icons/mypage.svg',
                        color: iconGreyColor,
                        width: 15,
                        height: 15,
                      ),
                      activeIcon: SvgPicture.asset(
                        'assets/icons/mypage.svg',
                        color: Get.theme.primaryColor,
                        width: 15,
                        height: 15,
                      ),
                    ),
                    // const BottomNavigationBarItem(
                    //   icon: Icon(Icons.star_border_outlined),
                    //   label: Strings.favorite,
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _HomeContent extends GetView<HomeViewController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (!controller.visible.value) {
        return const SizedBox();
      }

      return RefreshIndicator(
        onRefresh: controller.fetchData,
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  // _CarouselImagesContent(),
                  verticalSpaceMedium,
                  _ContractedGymList(),
                  verticalSpaceMedium,
                  _FavoriteGymList(),
                  verticalSpaceMedium,
                  _FavoriteGymList(),
                  verticalSpaceMedium,
                  _FavoriteGymList(),
                  verticalSpaceMedium,
                  _FavoriteGymList(),
                  verticalSpaceMedium,
                  // _RecommendedGymList(),
                  // verticalSpaceMedium,
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

class _HomeDrawer extends GetView<HomeViewController> {
  const _HomeDrawer();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 120,
              child: DrawerHeader(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: const Image(
                    image: AssetImage(
                      'assets/images/logo_drawer.png',
                    ),
                    height: 70,
                  ),
                ),
              ),
            ),
            if (controller.memberType.value == MemberType.noneMember)
              ListTile(
                leading: SvgPicture.asset(
                  'assets/icons/human.svg',
                  color: primaryColor,
                ),
                title: const Text(Strings.loginText),
                onTap: () => controller.toLogin,
              ),
              ListTile(
                leading: SvgPicture.asset(
                  'assets/icons/human.svg',
                  color: primaryColor,
                ),
                title: const Text(Strings.logoutLabel),
                onTap: controller.logout,
              ),
            ListTile(
              title: const Text(Strings.debugMenu),
              onTap: () => controller.toDebug(),
            ),
          ],
        ),
      );
    });
  }
}

class _MyPageAction extends GetView<HomeViewController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.memberType.value == MemberType.noneMember) {
        return const SizedBox();
      }
      return IconButton(
        onPressed: controller.toMyPage,
        icon: SvgPicture.asset(
          'assets/icons/mypage.svg',
          width: 24,
          height: 24,
        ),
      );
    });
  }
}

class _CarouselImagesContent extends GetView<HomeViewController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.images.isEmpty) {
        return const SizedBox();
      }
      return Column(
        children: [
          CarouselSlider(
            items: controller.images
                .map(
                  (item) => CachedNetworkImage(
                    imageUrl: item,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                )
                .toList(),
            carouselController: controller.imageCarouselController,
            options: CarouselOptions(
              height: 200,
              autoPlay: true,
              viewportFraction: 1,
              autoPlayInterval: const Duration(seconds: 2),
              onPageChanged: (index, reason) {
                controller.imageIndicatorIndex.value = index;
              },
            ),
          ),
          verticalSpaceMedium,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: controller.images.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => controller.imageCarouselController.animateToPage(entry.key),
                child: Container(
                  width: 6,
                  height: 6,
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: controller.imageIndicatorIndex.value == entry.key
                        ? Get.theme.primaryColor
                        : Colors.white,
                  ),
                ),
              );
            }).toList(),
          )
        ],
      );
    });
  }
}

class _NotificationAction extends GetView<HomeViewController> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: controller.toNotification,
      child: Stack(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: Icon(Icons.notifications_outlined),
          ),
          Obx(
            () => controller.unreadNotificationCount.value != 0
                ? Positioned(
                    left: 20,
                    top: 14,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 14,
                        minHeight: 12,
                      ),
                      child: Text(
                        controller.unreadNotificationCount.value > 99
                            ? Strings.over99
                            : controller.unreadNotificationCount.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                : const SizedBox(),
          ),
        ],
      ),
    );
  }
}

class _ContractedGymList extends GetView<HomeViewController> {
  @override
  Widget build(BuildContext context) {
    if (controller.contractedGyms.isEmpty) {
      return const SizedBox();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpaceMediumLarge,
        const _HomeContentTitle(
          title: Strings.contractedGym,
        ),
        verticalSpaceSmall,
        SizedBox(
          height: GymSummaryItem.height,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(
              horizontal: _HomeContentPadding.paddingSize - 4,
            ),
            physics: const BouncingScrollPhysics(),
            itemCount: controller.contractedGyms.length,
            // scrollDirection: Axis.horizontalこれを指定することで横スクロールになる
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final item = controller.contractedGyms.elementAt(index);
              return GymSummaryItem(
                imageUrl: item.imageUrl,
                name: item.name,
                numberOfUsers: item.numberOfUsers,
                onTap: () => controller.toGym(item.id),
                onTapFavorite: () => controller.onTapFavorite(),
              );
            },
          ),
        ),
        verticalSpaceMedium,
      ],
    );
  }
}

class _RecommendedGymList extends GetView<HomeViewController> {
  @override
  Widget build(BuildContext context) {
    if (controller.contractedGyms.isEmpty) {
      return const SizedBox();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpaceMediumLarge,
        const _HomeContentTitle(
          title: Strings.recommendedGym,
        ),
        verticalSpaceMedium,
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: SizedBox(
            height: GymSummaryItem.height,
            child: GridView.count(
                crossAxisCount: 2,
                children: controller.contractedGyms
                    .map(
                      (item) => GymSummaryItem(
                        imageUrl: item.imageUrl,
                        name: item.name,
                        numberOfUsers: item.numberOfUsers,
                        onTap: () => controller.toGym(item.id),
                        onTapFavorite: () => controller.onTapFavorite(),
                      ),
                )
                    .toList()),
          ),
        ),
        verticalSpaceMedium,
      ],
    );
  }
}

class _FavoriteGymList extends GetView<HomeViewController> {
  @override
  Widget build(BuildContext context) {
    if (controller.contractedGyms.isEmpty) {
      return const SizedBox();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpaceMediumLarge,
        const _HomeContentTitle(
          title: Strings.favoriteGym,
        ),
        verticalSpaceSmall,
        SizedBox(
          height: GymSummaryItem.height,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(
              horizontal: _HomeContentPadding.paddingSize - 4,
            ),
            physics: const BouncingScrollPhysics(),
            itemCount: controller.favoriteGyms.length,
            // scrollDirection: Axis.horizontalこれを指定することで横スクロールになる
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final item = controller.contractedGyms.elementAt(index);
              return GymSummaryItem(
                imageUrl: item.imageUrl,
                name: item.name,
                numberOfUsers: item.numberOfUsers,
                onTap: () => controller.toGym(item.id),
                onTapFavorite: () => controller.onTapFavorite(),
              );
            },
          ),
        ),
        verticalSpaceMedium,
      ],
    );
  }
}

class _HomeContentPadding extends StatelessWidget {
  const _HomeContentPadding({required this.child});

  final Widget child;

  static const paddingSize = 30.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: paddingSize),
      child: child,
    );
  }
}

class _HomeContentTitle extends StatelessWidget {
  const _HomeContentTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return _HomeContentPadding(
      child: Row(
        children: [
          Text(
            title,
            style: AppTextStyle.defaultStyle,
          ),
          const Spacer(),
          Text("View All", style: AppTextStyle.defaultStyleMedium),
          const SizedBox(
            width: 3,
          ),
          const Icon(
            Icons.arrow_forward,
            color: primaryColor,
            size: 10,
          )
        ],
      ),
    );
  }
}
//
// class _GymSummaryItem extends StatelessWidget {
//   const _GymSummaryItem({
//     super.key,
//     required this.imageUrl,
//     required this.name,
//     required this.numberOfUsers,
//     required this.onTap,
//     required this.onTapFavorite,
//   });
//
//   final String imageUrl;
//   final String name;
//   final int numberOfUsers;
//   final VoidCallback onTap;
//   final VoidCallback onTapFavorite;
//
//   static const height = 200.0;
//
//   @override
//   Widget build(BuildContext context) {
//     return _HomeContentPadding(
//       child: Row(
//         children: [
//           Text(
//             title,
//             style: AppTextStyle.defaultStyle,
//           ),
//           const Spacer(),
//           Text("View All", style: AppTextStyle.defaultStyleMedium),
//           const SizedBox(
//             width: 3,
//           ),
//           const Icon(
//             Icons.arrow_forward,
//             color: primaryColor,
//             size: 10,
//           )
//         ],
//       ),
//     );
//   }
// }
