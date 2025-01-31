import 'package:dumlupinargazetesi/generals/models/entry/entry_model.dart';
import 'package:dumlupinargazetesi/generals/models/status_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'category_entries.g.dart';

@JsonSerializable()
class CategoryEntries extends Status {
  final Data? data;

  CategoryEntries({
    this.data,
    required super.error,
  });

  factory CategoryEntries.fromJson(Map<String, dynamic> json) => _$CategoryEntriesFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryEntriesToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "entries")
  final List<Entry>? entries;
  @JsonKey(name: "total_entries")
  final int? totalEntries;
  @JsonKey(name: "total_pages")
  final int? totalPages;
  @JsonKey(name: "limit")
  final String? limit;

  Data({
    this.entries,
    this.totalEntries,
    this.totalPages,
    this.limit,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
