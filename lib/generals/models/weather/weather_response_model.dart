import 'package:dumlupinargazetesi/generals/models/status_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'weather_response_model.g.dart';

@JsonSerializable()
class WeatherResponseModel extends Status {
  @JsonKey(name: "data")
  final WeatherData? weatherData;

  WeatherResponseModel({
    required super.error,
    this.weatherData,
  });

  factory WeatherResponseModel.fromJson(Map<String, dynamic> json) => _$WeatherResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherResponseModelToJson(this);
}

@JsonSerializable()
class WeatherData {
  final String? province;
  final Map<String, DayWeather>? days;

  WeatherData({
    this.province,
    this.days,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) => _$WeatherDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDataToJson(this);
}

@JsonSerializable()
class DayWeather {
  final int? min;
  final int? max;
  final String? conditions;

  DayWeather({
    this.min,
    this.max,
    this.conditions,
  });

  factory DayWeather.fromJson(Map<String, dynamic> json) => _$DayWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$DayWeatherToJson(this);
}
