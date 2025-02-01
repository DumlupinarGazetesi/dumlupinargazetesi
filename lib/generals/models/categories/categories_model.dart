import 'package:dumlupinargazetesi/generals/models/status_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'category.dart';

part 'categories_model.g.dart';

@JsonSerializable()
class CategoriesResponse extends Status {
  @JsonKey(name: 'data', readValue: _readCategories)
  final List<Category> categories;

  CategoriesResponse({
    required this.categories,
    required super.error,
  });

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) => _$CategoriesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CategoriesResponseToJson(this);
}

Object? _readCategories(json, field) => json['data']['categories'];
