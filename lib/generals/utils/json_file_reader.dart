import 'dart:convert';
import 'package:flutter/services.dart';

class JsonReader {
  final String asset;

  JsonReader({required this.asset});

  Future<List<Map<String, dynamic>>> readFile() async {
    final String jsonString = await rootBundle.loadString(asset);
    final List<Map<String, dynamic>> jsonData = json.decode(jsonString).cast<Map<String, dynamic>>();
    return jsonData;
  }
}
