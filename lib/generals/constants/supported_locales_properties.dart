import 'package:flutter/material.dart';

class SupportedLocalesProperties {
  static List<Locale> supportedLocales = const [
    Locale('tr', 'TR'),

  ];

  static Locale fallbackLocale = const Locale('tr', 'TR');

  static String localeFilesPath = "assets/translations";
}
