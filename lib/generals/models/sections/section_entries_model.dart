import 'package:dumlupinargazetesi/generals/models/entry/entry_model.dart';
import 'package:dumlupinargazetesi/generals/models/status_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'section_entries_model.g.dart';

@JsonSerializable()
class SectionsResponse extends Status {
  @JsonKey(name: 'data', readValue: _readSectionEntries)
  final List<Entry> entries;
  SectionsResponse({required this.entries, required super.error});

  factory SectionsResponse.fromJson(Map<String, dynamic> json) => _$SectionsResponseFromJson(json);
}

Object? _readSectionEntries(json, field) => json['data']['entries'];
