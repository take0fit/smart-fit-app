// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gym_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GymDetail _$GymDetailFromJson(Map<String, dynamic> json) => GymDetail(
      id: json['id'] as int,
      name: json['name'] as String,
      imageUrls:
          (json['imageUrls'] as List<dynamic>).map((e) => e as String).toList(),
      numberOfUsers: json['numberOfUsers'] as int,
      address: json['address'] as String,
      area: json['area'] as String,
      businessHours: json['businessHours'] as String,
      monthlyAmount: json['monthlyAmount'] as int,
      isFavorite: json['isFavorite'] as bool,
    );

Map<String, dynamic> _$GymDetailToJson(GymDetail instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrls': instance.imageUrls,
      'numberOfUsers': instance.numberOfUsers,
      'address': instance.address,
      'area': instance.area,
      'businessHours': instance.businessHours,
      'monthlyAmount': instance.monthlyAmount,
      'isFavorite': instance.isFavorite,
    };
