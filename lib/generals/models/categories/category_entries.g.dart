// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_entries.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryEntries _$CategoryEntriesFromJson(Map<String, dynamic> json) =>
    CategoryEntries(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      error: json['error'] as bool,
    );

Map<String, dynamic> _$CategoryEntriesToJson(CategoryEntries instance) =>
    <String, dynamic>{
      'error': instance.error,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      entries: (json['entries'] as List<dynamic>?)
          ?.map((e) => Entry.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalEntries: (json['total_entries'] as num?)?.toInt(),
      totalPages: (json['total_pages'] as num?)?.toInt(),
      limit: json['limit'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'entries': instance.entries,
      'total_entries': instance.totalEntries,
      'total_pages': instance.totalPages,
      'limit': instance.limit,
    };
