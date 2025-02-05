// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResponse _$SearchResponseFromJson(Map<String, dynamic> json) =>
    SearchResponse(
      error: json['error'] as bool,
      entries: (readValue(json, 'entries') as List<dynamic>?)
          ?.map((e) => EntryDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalItems: readValue(json, 'total_items') as String?,
      totalPages: (readValue(json, 'total_pages') as num?)?.toInt(),
    );

Map<String, dynamic> _$SearchResponseToJson(SearchResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'total_items': instance.totalItems,
      'total_pages': instance.totalPages,
      'entries': instance.entries,
    };
