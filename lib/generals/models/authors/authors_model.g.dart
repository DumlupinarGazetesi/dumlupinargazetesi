// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authors_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Authors _$AuthorsFromJson(Map<String, dynamic> json) => Authors(
      authors: (readAuthorsData(json, 'data') as List<dynamic>?)
          ?.map((e) => Author.fromJson(e as Map<String, dynamic>))
          .toList(),
      error: json['error'] as bool,
    );

Map<String, dynamic> _$AuthorsToJson(Authors instance) => <String, dynamic>{
      'error': instance.error,
      'data': instance.authors,
    };
