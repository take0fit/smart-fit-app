import 'package:json_annotation/json_annotation.dart';

part 'machine_summary.g.dart';

@JsonSerializable()
class MachineSummary {
  MachineSummary({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory MachineSummary.fromJson(dynamic json) => _$MachineSummaryFromJson(json);

  final int id;
  final String name;
  final String imageUrl;
}
