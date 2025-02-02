import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dumlupinargazetesi/generals/constants/api_addresses.dart';
import 'package:dumlupinargazetesi/generals/constants/generated_translations/locale_keys.g.dart';
import 'package:dumlupinargazetesi/main.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart' as get_pkg;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

part 'dio_interceptors.dart';

class DioConfig {
  final Dio _dio = Dio(
    BaseOptions(
      headers: {HttpHeaders.acceptHeader: 'application/json'},
      connectTimeout: const Duration(milliseconds: 10000),
      receiveTimeout: const Duration(milliseconds: 10000),
    ),
  );

  DioConfig() {
    addInterceptors();
  }

  addInterceptors() {
    _dio.interceptors.clear();

    RequestInterceptors requestInterceptors = RequestInterceptors();

    _dio.interceptors.addAll([
      prettyDioLogger,
      dioCacheInterceptor,
      requestInterceptors,
    ]);
  }

  Dio get dio => _dio;
}
