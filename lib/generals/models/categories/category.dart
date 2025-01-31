import 'package:json_annotation/json_annotation.dart';
part 'category.g.dart';

@JsonSerializable()
class Category {
  final int id;
  final String tag;
  final int parentId;
  final String title;
  final int total;

  Category({
    required this.id,
    required this.tag,
    required this.parentId,
    required this.title,
    required this.total,
  });

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
