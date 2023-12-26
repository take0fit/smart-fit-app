// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'machine_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MachineSummary _$MachineSummaryFromJson(Map<String, dynamic> json) =>
    MachineSummary(
      id: json['id'] as int,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$MachineSummaryToJson(MachineSummary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
    };
