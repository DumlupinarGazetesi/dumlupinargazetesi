import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class DateUtil {
  static String formatTurkishDate(String dateString) {
    try {
      DateTime date = DateTime.parse(dateString);
      return DateFormat("dd MMM EEE", "tr_TR").format(date).toUpperCase();
    } catch (e) {
      return "Geçersiz Tarih"; // Handle errors gracefully
    }
  }
}
