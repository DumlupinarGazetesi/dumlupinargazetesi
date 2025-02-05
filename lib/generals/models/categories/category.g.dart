// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: (json['id'] as num).toInt(),
      tag: json['tag'] as String?,
      parentId: (json['parentId'] as num?)?.toInt(),
      title: json['title'] as String?,
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'tag': instance.tag,
      'parentId': instance.parentId,
      'title': instance.title,
      'total': instance.total,
    };
