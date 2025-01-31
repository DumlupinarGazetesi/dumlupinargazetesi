// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EntryDetail _$EntryDetailFromJson(Map<String, dynamic> json) => EntryDetail(
      entry: _readEntryData(json, 'data') == null
          ? null
          : Entry.fromJson(
              _readEntryData(json, 'data') as Map<String, dynamic>),
      error: json['error'] as bool,
    );

Map<String, dynamic> _$EntryDetailToJson(EntryDetail instance) =>
    <String, dynamic>{
      'error': instance.error,
      'data': instance.entry,
    };
