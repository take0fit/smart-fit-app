import 'package:json_annotation/json_annotation.dart';

part 'gym_detail.g.dart';

@JsonSerializable()
class GymDetail {
  GymDetail({
    required this.id,
    required this.name,
    required this.imageUrls,
    required this.numberOfUsers,
    required this.address,
    required this.area,
    required this.businessHours,
    required this.monthlyAmount,
    required this.isFavorite,
  });

  factory GymDetail.fromJson(dynamic json) => _$GymDetailFromJson(json);

  final int id;
  final String name;
  final List<String> imageUrls;
  final int numberOfUsers;
  final String address;
  final String area;
  final String businessHours;
  final int monthlyAmount;
  final bool isFavorite;
}
