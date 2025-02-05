import 'package:dumlupinargazetesi/generals/models/authors/author.dart';
import 'package:dumlupinargazetesi/generals/models/categories/category.dart';
import 'package:json_annotation/json_annotation.dart';
part 'entry_model.g.dart';

Object? readImageField(json, field) {
  if (json['image'] is String) return {"url": json['image']};

  return json['image'];
}

@JsonSerializable()
class Entry {
  final int? id;
  final String? title;
  final String? description;

  final String? body;
  @JsonKey(name: "author_id")
  final dynamic authorId;
  @JsonKey(name: "province_id")
  final int? provinceId;
  @JsonKey(name: "county_id")
  final int? countyId;
  final String? status;
  final String? url;
  @JsonKey(name: "image", readValue: readImageField)
  final EntryImage? image;
  @JsonKey(name: "published_at")
  final DateTime? publishedAt;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  final List<Category>? categories;
  final Attachments? attachments;
  @JsonKey(name: 'image_default')
  final String? imageDefault;

  final bool? customImage;

  @JsonKey(name: "src_id")
  final int? srcId;
  @JsonKey(name: "src_type")
  final String? srcType;
  final int? nth;
  final Author? author;
  final String? type;

  Entry({
    this.body,
    this.authorId,
    this.provinceId,
    this.countyId,
    this.status,
    this.url,
    this.categories,
    this.attachments,
    this.id,
    this.title,
    this.description,
    this.image,
    this.publishedAt,
    this.createdAt,
    this.updatedAt,
    this.imageDefault,
    this.nth,
    this.srcId,
    this.srcType,
    this.type,
    this.customImage,
    this.author,
  });

  factory Entry.fromJson(Map<String, dynamic> json) => _$EntryFromJson(json);

  Map<String, dynamic> toJson() => _$EntryToJson(this);
}

@JsonSerializable()
class EntryImage {
  final int? width;
  final int? height;
  final String? orientation;
  final String? url;
  final dynamic content;
  final String? small;
  final String? medium;
  final String? large;

  EntryImage({
    this.width,
    this.height,
    this.orientation,
    this.url,
    this.content,
    this.small,
    this.medium,
    this.large,
  });

  factory EntryImage.fromJson(Map<String, dynamic> json) => _$EntryImageFromJson(json);

  Map<String, dynamic> toJson() => _$EntryImageToJson(this);
}

@JsonSerializable()
class Attachments {
  @JsonKey(name: "default")
  final Default? attachmentsDefault;
  @JsonKey(name: "top_cover")
  final Default? topCover;

  Attachments({
    this.attachmentsDefault,
    this.topCover,
  });

  factory Attachments.fromJson(Map<String, dynamic> json) => _$AttachmentsFromJson(json);

  Map<String, dynamic> toJson() => _$AttachmentsToJson(this);
}

@JsonSerializable()
class Default {
  final List<EntryImage>? images;

  Default({
    this.images,
  });

  factory Default.fromJson(Map<String, dynamic> json) => _$DefaultFromJson(json);

  Map<String, dynamic> toJson() => _$DefaultToJson(this);
}