// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherResponseModel _$WeatherResponseModelFromJson(
        Map<String, dynamic> json) =>
    WeatherResponseModel(
      error: json['error'] as bool,
      weatherData: json['data'] == null
          ? null
          : WeatherData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherResponseModelToJson(
        WeatherResponseModel instance) =>
    <String, dynamic>{
      'error': instance.error,
      'data': instance.weatherData,
    };

WeatherData _$WeatherDataFromJson(Map<String, dynamic> json) => WeatherData(
      province: json['province'] as String?,
      days: (json['days'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, DayWeather.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$WeatherDataToJson(WeatherData instance) =>
    <String, dynamic>{
      'province': instance.province,
      'days': instance.days,
    };

DayWeather _$DayWeatherFromJson(Map<String, dynamic> json) => DayWeather(
      min: (json['min'] as num?)?.toInt(),
      max: (json['max'] as num?)?.toInt(),
      conditions: json['conditions'] as String?,
    );

Map<String, dynamic> _$DayWeatherToJson(DayWeather instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
      'conditions': instance.conditions,
    };
