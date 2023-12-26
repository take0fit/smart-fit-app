import 'package:json_annotation/json_annotation.dart';

part 'body_part_summary.g.dart';

@JsonSerializable()
class BodyPartSummary {
  BodyPartSummary({
    required this.id,
    required this.name,
  });

  factory BodyPartSummary.fromJson(dynamic json) => _$BodyPartSummaryFromJson(json);

  final int id;
  final String name;
}
