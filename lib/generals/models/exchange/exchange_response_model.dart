import 'package:dumlupinargazetesi/generals/models/status_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'exchange_response_model.g.dart';

@JsonSerializable()
class ExchangeData extends Status {
  final Map<String, PriceData>? data;

  ExchangeData({
    required super.error,
    this.data,
  });

  factory ExchangeData.fromJson(Map<String, dynamic> json) => _$ExchangeDataFromJson(json);

  Map<String, dynamic> toJson() => _$ExchangeDataToJson(this);
}

@JsonSerializable()
class PriceData {
  final String? dir;
  final String? val;

  PriceData({
    this.dir,
    this.val,
  });

  factory PriceData.fromJson(Map<String, dynamic> json) => _$PriceDataFromJson(json);

  Map<String, dynamic> toJson() => _$PriceDataToJson(this);
}
