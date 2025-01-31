// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advertisements.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Advertisements _$AdvertisementsFromJson(Map<String, dynamic> json) =>
    Advertisements(
      error: json['error'] as bool,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AdvertisementsToJson(Advertisements instance) =>
    <String, dynamic>{
      'error': instance.error,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      channel: json['channel'] == null
          ? null
          : Channel.fromJson(json['channel'] as Map<String, dynamic>),
      adverts: (json['adverts'] as List<dynamic>?)
          ?.map((e) => Advertisement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'channel': instance.channel,
      'adverts': instance.adverts,
    };

Channel _$ChannelFromJson(Map<String, dynamic> json) => Channel(
      id: (json['id'] as num?)?.toInt(),
      tag: json['tag'] as String?,
    );

Map<String, dynamic> _$ChannelToJson(Channel instance) => <String, dynamic>{
      'id': instance.id,
      'tag': instance.tag,
    };
