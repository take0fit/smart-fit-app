import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smart_fit/ui/common/ui_helper.dart';
import 'package:smart_fit/ui/widget/gym_image_item.dart';

import '../common/app_color.dart';

class GymSummaryItem extends StatelessWidget {
  const GymSummaryItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.numberOfUsers,
    required this.onTap,
    required this.onTapFavorite,
  });

  final String imageUrl;
  final String name;
  final int numberOfUsers;
  final VoidCallback onTap;
  final VoidCallback onTapFavorite;

  static const height = 200.0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Container(
          // clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          height: 200,
          width: 220,
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: GymImageItem(
                  imageUrl: imageUrl,
                  isFavorite: true,
                  onTapFavorite: onTapFavorite,
                  height: 140,
                  width: double.infinity,
                ),
              ),
              // CachedNetworkImage(
              //   height: 120,
              //   fit: BoxFit.cover,
              //   width: double.infinity,
              //   imageUrl: imageUrl,
              //   placeholder: (context, url) => const Center(
              //     child: CircularProgressIndicator(),
              //   ),
              // ),
              verticalSpaceSmall,
              Text(
                name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "現在の利用人数: $numberOfUsers 名",
                style: const TextStyle(fontSize: 14, color: gray1),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      ),
    );
  }
}
