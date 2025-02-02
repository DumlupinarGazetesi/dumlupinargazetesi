// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _tr_TR = {
  "home": "Anasayfa",
  "agenda": "Gündem",
  "authors": "Yazarlar",
  "economy": "Ekonomi",
  "sports": "Spor",
  "official_ads": "Resmi İlanlar",
  "error_connect": "Bir şeyler yanlış gitti",
  "poor_connection": "Zayıf internet bağlantısı!",
  "press_back_to_exit": "Çıkmak için tekrar geri tuşuna basın"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"tr_TR": _tr_TR};
}
