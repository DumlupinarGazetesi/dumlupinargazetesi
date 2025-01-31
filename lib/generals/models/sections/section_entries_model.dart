import 'package:dumlupinargazetesi/generals/models/entry/entry_model.dart';
import 'package:dumlupinargazetesi/generals/models/status_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'section_entries_model.g.dart';

@JsonSerializable()
class Sections extends Status {
  @JsonKey(name: 'data', readValue: _readSectionEntries)
  final List<Entry> entries;
  Sections({required this.entries, required super.error});

  factory Sections.fromJson(Map<String, dynamic> json) => _$SectionsFromJson(json);
}

Object? _readSectionEntries(json, field) => json['data']['entries'];
