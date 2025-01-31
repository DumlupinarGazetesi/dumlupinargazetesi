import 'package:json_annotation/json_annotation.dart';
part  'advertisement.g.dart';

@JsonSerializable()
class Advertisement {
  final int? id;
  final String? url;
  final AdvertImages? images;

  @JsonKey(name: "image_sizes")
  final ImageSizes? imageSizes;

  Advertisement({
    this.id,
    this.url,
    this.images,
    this.imageSizes,
  });

  factory Advertisement.fromJson(Map<String, dynamic> json) => _$AdvertisementFromJson(json);

  Map<String, dynamic> toJson() => _$AdvertisementToJson(this);
}

@JsonSerializable()
class ImageSizes {
  final ImageSize? desktop;
  final ImageSize? mobile;

  ImageSizes({
    this.desktop,
    this.mobile,
  });

  factory ImageSizes.fromJson(Map<String, dynamic> json) => _$ImageSizesFromJson(json);

  Map<String, dynamic> toJson() => _$ImageSizesToJson(this);
}

@JsonSerializable()
class ImageSize {
  final int? width;
  final int? height;

  ImageSize({
    this.width,
    this.height,
  });

  factory ImageSize.fromJson(Map<String, dynamic> json) => _$ImageSizeFromJson(json);

  Map<String, dynamic> toJson() => _$ImageSizeToJson(this);
}

@JsonSerializable()
class AdvertImages {
  final String? desktop;
  final String? mobile;

  AdvertImages({
    this.desktop,
    this.mobile,
  });

  factory AdvertImages.fromJson(Map<String, dynamic> json) => _$AdvertImagesFromJson(json);

  Map<String, dynamic> toJson() => _$AdvertImagesToJson(this);
}
