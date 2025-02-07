import 'package:dumlupinargazetesi/generals/utils/dio_settings/dio_config.dart';
import 'package:logger/logger.dart';

class AppHelper{
  static DioConfig dioConfig = DioConfig();
  static Logger log = Logger();

  static String convertTurkishCharacters(String? input) {
    if(input == null) return '';
    Map<String, String> turkishMap = {
      'Ç': 'C', 'Ğ': 'G', 'İ': 'I', 'Ö': 'O', 'Ş': 'S', 'Ü': 'U',
      'ç': 'c', 'ğ': 'g', 'ı': 'i', 'ö': 'o', 'ş': 's', 'ü': 'u'
    };

    return input.split('').map((char) => turkishMap[char] ?? char).join().toLowerCase();
  }
}