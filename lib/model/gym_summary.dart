import 'package:json_annotation/json_annotation.dart';

part 'gym_summary.g.dart';

@JsonSerializable()
class GymSummary {
  GymSummary({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.numberOfUsers,
  });

  factory GymSummary.fromJson(dynamic json) => _$GymSummaryFromJson(json);

  final int id;
  final String name;
  final String imageUrl;
  final int numberOfUsers;
}
