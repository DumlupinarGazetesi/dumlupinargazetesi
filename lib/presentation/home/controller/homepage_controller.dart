import 'package:dumlupinargazetesi/generals/api_services/api_repository.dart';
import 'package:dumlupinargazetesi/generals/models/entry/entry_model.dart';
import 'package:dumlupinargazetesi/generals/models/models.dart';
import 'package:dumlupinargazetesi/generals/utils/app_helper.dart';
import 'package:dumlupinargazetesi/presentation/home/view/homepage_tabs.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class HomePageController extends GetxController {
  RxString selectedTab = HomePageTabs.tabs.first.obs;

  final DumlupinarGazetesiApiClient _apiClient = DumlupinarGazetesiApiClient(AppHelper.dioConfig.dio);

  Advertisements? advertisements;
  WeatherData? kutahyaWeatherData;
  List<Entry>? topCovers;
  ExchangeData? exchange;
  List<Entry>? featuredCovers;
  List<Entry>? simpleCovers;

  final Rx<bool> isGettingExchange = false.obs;
  final Rx<bool> isGettingKutahyaWeather = false.obs;
  final Rx<bool> isGettingTopCovers = false.obs;
  final Rx<bool> isGettingFeaturedCovers = false.obs;
  final Rx<bool> isGettingCovers = false.obs;

  @override
  void onInit() {
    getExchangeData();
    getKutahyaWeather();
    getTopCovers();
    getFeaturedCovers();
    getSimpleCovers();
    super.onInit();
  }

  set changeTab(String tab) => selectedTab(tab);

  Future<dynamic> getAdvertisements() async {
    final result = await _apiClient.getAdvertisement('ana-1');

    if (result.response.statusCode == 200) {
      advertisements = result.data;
      return advertisements;
    } else {
      AppHelper.log.log(Level.error, result.response.statusMessage);
    }
  }

  Future getKutahyaWeather() async {
    isGettingKutahyaWeather(true);
    final result = await _apiClient.getWeather("43");

    if (result.response.statusCode == 200) {
      kutahyaWeatherData = result.data.weatherData;
    } else {
      AppHelper.log.log(Level.error, result.response.statusMessage);
    }
    isGettingKutahyaWeather(false);
  }

  // top covers
  Future getTopCovers() async {
    isGettingTopCovers(true);

    final result = await _apiClient.getSectionData("top_cover");

    if (result.response.statusCode == 200) {
      topCovers = result.data.entries;
    } else {
      AppHelper.log.log(Level.error, result.response.statusMessage);
    }
    isGettingTopCovers(false);
  }

  Future getExchangeData() async {
    isGettingExchange(true);

    final result = await _apiClient.getExchange();
    if (result.response.statusCode == 200) {
      exchange = result.data;
    } else {
      AppHelper.log.log(Level.error, result.response.statusMessage);
    }

    isGettingExchange(false);
  }

  // featured covers
  Future getFeaturedCovers() async {
    isGettingFeaturedCovers(true);
    final result = await _apiClient.getSectionData("featured");

    if (result.response.statusCode == 200) {
      featuredCovers = result.data.entries;
    } else {
      AppHelper.log.log(Level.error, result.response.statusMessage);
    }
    isGettingFeaturedCovers(false);
  }

  // covers
  Future getSimpleCovers() async {
    isGettingCovers(true);
    final result = await _apiClient.getSectionData("cover");

    if (result.response.statusCode == 200) {
      simpleCovers = result.data.entries;
    } else {
      AppHelper.log.log(Level.error, result.response.statusMessage);
    }
    isGettingCovers(false);
  }
}
