import 'package:dumlupinargazetesi/generals/api_services/api_repository.dart';
import 'package:dumlupinargazetesi/generals/models/advertisements/advertisements.dart';
import 'package:dumlupinargazetesi/generals/models/models.dart';
import 'package:dumlupinargazetesi/generals/utils/app_helper.dart';
import 'package:dumlupinargazetesi/presentation/home/view/homepage_tabs.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class HomePageController extends GetxController {
  RxString selectedTab = HomePageTabs.tabs.first.obs;

  final DumlupinarGazetesiApiClient _apiClient = DumlupinarGazetesiApiClient(AppHelper.dioConfig.dio);

  Advertisements? advertisements;
  WeatherData? weatherData;

  set changeTab(String tab) => selectedTab(tab);

  Future getAdvertisements() async {
    final result = await _apiClient.getAdvertisement('ana-1');

    if (result.response.statusCode == 200) {
      advertisements = result.data;
    } else {
      AppHelper.log.log(Level.error, result.response.statusMessage);
    }
  }

  Future getKutahyaWeather() async {
    final result = await _apiClient.getWeather("43");

    if (result.response.statusCode == 200) {
      weatherData = result.data.weatherData;
    } else {
      AppHelper.log.log(Level.error, result.response.statusMessage);
    }
  }
}
