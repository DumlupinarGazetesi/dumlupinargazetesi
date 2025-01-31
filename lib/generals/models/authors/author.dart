import 'package:dumlupinargazetesi/generals/models/entry/entry_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'author.g.dart';

@JsonSerializable()
class Author {
  final int? id;

  final int? nth;

  final String? title;
  @JsonKey(name: "first_name")
  final String? firstName;
  @JsonKey(name: "last_name")
  final String? lastName;

  final String? bio;

  final String? avatar;

  final List<Entry>? entries;

  Author({
    this.id,
    this.nth,
    this.title,
    this.firstName,
    this.lastName,
    this.bio,
    this.avatar,
    this.entries,
  });

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}
