// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Entry _$EntryFromJson(Map<String, dynamic> json) => Entry(
      body: json['body'] as String?,
      authorId: json['author_id'],
      provinceId: (json['province_id'] as num?)?.toInt(),
      countyId: (json['county_id'] as num?)?.toInt(),
      status: json['status'] as String?,
      url: json['url'] as String?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      attachments: json['attachments'] == null
          ? null
          : Attachments.fromJson(json['attachments'] as Map<String, dynamic>),
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      image: readImageField(json, 'image') == null
          ? null
          : EntryImage.fromJson(
              readImageField(json, 'image') as Map<String, dynamic>),
      publishedAt: json['published_at'] == null
          ? null
          : DateTime.parse(json['published_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      imageDefault: json['image_default'] as String?,
      nth: (json['nth'] as num?)?.toInt(),
      srcId: (json['src_id'] as num?)?.toInt(),
      srcType: json['src_type'] as String?,
      type: json['type'] as String?,
      customImage: json['customImage'] as bool?,
      author: json['author'] == null
          ? null
          : Author.fromJson(json['author'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EntryToJson(Entry instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'body': instance.body,
      'author_id': instance.authorId,
      'province_id': instance.provinceId,
      'county_id': instance.countyId,
      'status': instance.status,
      'url': instance.url,
      'image': instance.image,
      'published_at': instance.publishedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'categories': instance.categories,
      'attachments': instance.attachments,
      'image_default': instance.imageDefault,
      'customImage': instance.customImage,
      'src_id': instance.srcId,
      'src_type': instance.srcType,
      'nth': instance.nth,
      'author': instance.author,
      'type': instance.type,
    };

EntryImage _$EntryImageFromJson(Map<String, dynamic> json) => EntryImage(
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      orientation: json['orientation'] as String?,
      url: json['url'] as String?,
      content: json['content'],
      small: json['small'] as String?,
      medium: json['medium'] as String?,
      large: json['large'] as String?,
    );

Map<String, dynamic> _$EntryImageToJson(EntryImage instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'orientation': instance.orientation,
      'url': instance.url,
      'content': instance.content,
      'small': instance.small,
      'medium': instance.medium,
      'large': instance.large,
    };

Attachments _$AttachmentsFromJson(Map<String, dynamic> json) => Attachments(
      attachmentsDefault: json['default'] == null
          ? null
          : Default.fromJson(json['default'] as Map<String, dynamic>),
      topCover: json['top_cover'] == null
          ? null
          : Default.fromJson(json['top_cover'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AttachmentsToJson(Attachments instance) =>
    <String, dynamic>{
      'default': instance.attachmentsDefault,
      'top_cover': instance.topCover,
    };

Default _$DefaultFromJson(Map<String, dynamic> json) => Default(
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => EntryImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DefaultToJson(Default instance) => <String, dynamic>{
      'images': instance.images,
    };
