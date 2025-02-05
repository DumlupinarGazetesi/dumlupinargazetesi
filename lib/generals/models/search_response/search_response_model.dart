import 'package:dumlupinargazetesi/generals/models/entry/entry_detail.dart';
import 'package:dumlupinargazetesi/generals/models/status_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_response_model.g.dart';

@JsonSerializable()
class SearchResponse extends Status {
  @JsonKey(name: "total_items",readValue: readValue)
  final String? totalItems;

  @JsonKey(name: 'total_pages', readValue: readValue)
  final int? totalPages;

  @JsonKey(name: 'entries', readValue: readValue)
  final List<EntryDetail>? entries;

  SearchResponse({required super.error, this.entries, this.totalItems, this.totalPages});

  factory SearchResponse.fromJson(Map<String, dynamic> json) => _$SearchResponseFromJson(json);
}

readValue(json,field)=> json['data'][field];