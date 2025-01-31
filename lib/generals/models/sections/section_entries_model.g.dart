// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section_entries_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sections _$SectionsFromJson(Map<String, dynamic> json) => Sections(
      entries: (_readSectionEntries(json, 'data') as List<dynamic>)
          .map((e) => Entry.fromJson(e as Map<String, dynamic>))
          .toList(),
      error: json['error'] as bool,
    );

Map<String, dynamic> _$SectionsToJson(Sections instance) => <String, dynamic>{
      'error': instance.error,
      'data': instance.entries,
    };
