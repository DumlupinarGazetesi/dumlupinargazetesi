// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advertisement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Advertisement _$AdvertisementFromJson(Map<String, dynamic> json) =>
    Advertisement(
      id: (json['id'] as num?)?.toInt(),
      url: json['url'] as String?,
      images: json['images'] == null
          ? null
          : AdvertImages.fromJson(json['images'] as Map<String, dynamic>),
      imageSizes: json['image_sizes'] == null
          ? null
          : ImageSizes.fromJson(json['image_sizes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AdvertisementToJson(Advertisement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'images': instance.images,
      'image_sizes': instance.imageSizes,
    };

ImageSizes _$ImageSizesFromJson(Map<String, dynamic> json) => ImageSizes(
      desktop: json['desktop'] == null
          ? null
          : ImageSize.fromJson(json['desktop'] as Map<String, dynamic>),
      mobile: json['mobile'] == null
          ? null
          : ImageSize.fromJson(json['mobile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ImageSizesToJson(ImageSizes instance) =>
    <String, dynamic>{
      'desktop': instance.desktop,
      'mobile': instance.mobile,
    };

ImageSize _$ImageSizeFromJson(Map<String, dynamic> json) => ImageSize(
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ImageSizeToJson(ImageSize instance) => <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
    };

AdvertImages _$AdvertImagesFromJson(Map<String, dynamic> json) => AdvertImages(
      desktop: json['desktop'] as String?,
      mobile: json['mobile'] as String?,
    );

Map<String, dynamic> _$AdvertImagesToJson(AdvertImages instance) =>
    <String, dynamic>{
      'desktop': instance.desktop,
      'mobile': instance.mobile,
    };
