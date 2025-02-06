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


  static String formatTurkishDateWithYear(String dateString) {
    try {
      DateTime date = DateTime.parse(dateString);
      return DateFormat("dd MMM yyyy - HH:mm", "tr_TR").format(date);
    } catch (e) {
      return "Geçersiz Tarih"; // Handle errors gracefully
    }
  }

  static String formatTurkishDateWithDay(DateTime dateTime) {
    DateTime now = DateTime.now();
    DateTime yesterday = now.subtract(Duration(days: 1));

    String time = DateFormat('HH:mm').format(dateTime); // Format time as HH:mm
    String month = DateFormat('MMM', 'tr_TR').format(dateTime); // Get month name in Turkish

    if (DateFormat('yyyy-MM-dd').format(dateTime) == DateFormat('yyyy-MM-dd').format(now)) {
      return "Bugün, $time"; // Today
    } else if (DateFormat('yyyy-MM-dd').format(dateTime) == DateFormat('yyyy-MM-dd').format(yesterday)) {
      return "Dün, $time"; // Yesterday
    } else {
      String year = dateTime.year == now.year ? '' : '${dateTime.year}, ';
      return "$year$month $time"; // Example: "Sub 3, 05:45" or "Sub 3 2024, 05:45"
    }
  }

}
