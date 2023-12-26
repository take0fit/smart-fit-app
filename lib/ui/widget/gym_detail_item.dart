import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smart_fit/ui/common/ui_helper.dart';

import '../common/app_color.dart';

class GymDetailItem extends StatelessWidget {
  const GymDetailItem({
    super.key,
    required this.name,
    required this.numberOfUsers,
    required this.address,
    required this.area,
    required this.businessHours,
    required this.monthlyAmount,
  });

  final String name;
  final int numberOfUsers;
  final String address;
  final String area;
  final String businessHours;
  final int monthlyAmount;

  static const height = 150.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          verticalSpaceMedium,
          Text(
            "現在の利用人数: $numberOfUsers 名",
            style: const TextStyle(fontSize: 14, color: gray1),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          verticalSpaceMedium,
          Text(
            "住所: $address",
            style: const TextStyle(fontSize: 14, color: gray1),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          verticalSpaceMedium,
          Text(
            "所在地エリア: $area",
            style: const TextStyle(fontSize: 14, color: gray1),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          verticalSpaceMedium,
          Text(
            "営業時間: $businessHours",
            style: const TextStyle(fontSize: 14, color: gray1),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          verticalSpaceMedium,
          Text(
            "月額利用料金: $monthlyAmount 円",
            style: const TextStyle(fontSize: 14, color: gray1),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          verticalSpaceMedium,
        ],
      ),
    );
  }
}
