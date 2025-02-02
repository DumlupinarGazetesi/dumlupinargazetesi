// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section_entries_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectionsResponse _$SectionsResponseFromJson(Map<String, dynamic> json) =>
    SectionsResponse(
      entries: (_readSectionEntries(json, 'data') as List<dynamic>)
          .map((e) => Entry.fromJson(e as Map<String, dynamic>))
          .toList(),
      error: json['error'] as bool,
    );

Map<String, dynamic> _$SectionsResponseToJson(SectionsResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'data': instance.entries,
    };
