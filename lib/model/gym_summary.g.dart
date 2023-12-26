// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gym_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GymSummary _$GymSummaryFromJson(Map<String, dynamic> json) => GymSummary(
      id: json['id'] as int,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      numberOfUsers: json['numberOfUsers'] as int,
    );

Map<String, dynamic> _$GymSummaryToJson(GymSummary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'numberOfUsers': instance.numberOfUsers,
    };
