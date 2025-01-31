import 'package:dumlupinargazetesi/generals/models/status_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'entry_model.dart';
part 'entry_detail.g.dart';


@JsonSerializable()
class EntryDetail extends Status {
  @JsonKey(name: "data", readValue: _readEntryData)
  final Entry? entry;

  EntryDetail({
    this.entry,
    required super.error,
  });

  factory EntryDetail.fromJson(Map<String, dynamic> json) => _$EntryDetailFromJson(json);

  Map<String, dynamic> toJson() => _$EntryDetailToJson(this);
}

Object? _readEntryData(json, field) => json['data']['entry'];
