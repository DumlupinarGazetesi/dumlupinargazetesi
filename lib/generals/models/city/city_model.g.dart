// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

City _$CityFromJson(Map<String, dynamic> json) => City(
      title: json['key'] as String,
      value: json['value'] as String,
      provinceId: (json['province_id'] as num).toInt(),
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'key': instance.title,
      'value': instance.value,
      'province_id': instance.provinceId,
    };
