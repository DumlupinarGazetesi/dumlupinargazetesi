// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Author _$AuthorFromJson(Map<String, dynamic> json) => Author(
      id: (json['id'] as num?)?.toInt(),
      nth: (json['nth'] as num?)?.toInt(),
      title: json['title'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      bio: json['bio'] as String?,
      avatar: json['avatar'] as String?,
      entries: (json['entries'] as List<dynamic>?)
          ?.map((e) => Entry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
      'id': instance.id,
      'nth': instance.nth,
      'title': instance.title,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'bio': instance.bio,
      'avatar': instance.avatar,
      'entries': instance.entries,
    };
