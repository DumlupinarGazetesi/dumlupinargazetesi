// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExchangeData _$ExchangeDataFromJson(Map<String, dynamic> json) => ExchangeData(
      error: json['error'] as bool,
      data: (json['data'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, PriceData.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$ExchangeDataToJson(ExchangeData instance) =>
    <String, dynamic>{
      'error': instance.error,
      'data': instance.data,
    };

PriceData _$PriceDataFromJson(Map<String, dynamic> json) => PriceData(
      dir: json['dir'] as String?,
      val: json['val'] as String?,
    );

Map<String, dynamic> _$PriceDataToJson(PriceData instance) => <String, dynamic>{
      'dir': instance.dir,
      'val': instance.val,
    };
