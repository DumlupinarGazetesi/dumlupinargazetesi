import 'package:json_annotation/json_annotation.dart';
part 'city_model.g.dart';

@JsonSerializable()
class City {
  @JsonKey(name: "key")
  final String title;
  final String value;

  @JsonKey(name: "province_id")
  final int provinceId;

  City({required this.title, required this.value, required this.provinceId});


  factory City.fromJson(Map<String,dynamic> json)=> _$CityFromJson(json);
}
