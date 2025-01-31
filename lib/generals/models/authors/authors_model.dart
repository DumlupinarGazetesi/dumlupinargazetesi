import 'package:dumlupinargazetesi/generals/models/status_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'author.dart';
part 'authors_model.g.dart';

@JsonSerializable()
class Authors extends Status {
  @JsonKey(name: "data", readValue: readAuthorsData)
  final List<Author>? authors;

  Authors({
    this.authors,
    required super.error,
  });

  factory Authors.fromJson(Map<String, dynamic> json) => _$AuthorsFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorsToJson(this);
}

Object? readAuthorsData(json, field) => json['data']['authors'];
