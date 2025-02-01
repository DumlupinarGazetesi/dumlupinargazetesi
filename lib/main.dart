import 'package:dumlupinargazetesi/presentation/dumlupinar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'generals/models/city/city_model.dart';
import 'generals/utils/json_file_reader.dart';

late final HiveCacheStore hiveCacheStore;
final List<City> cities = [];

initializeHiveCache() async {
  dynamic tempDir = await getTemporaryDirectory();
  hiveCacheStore = HiveCacheStore(tempDir.path);
}

readCities() async {
  JsonReader reader = JsonReader(asset: "assets/cities.json");
  List<Map<String, dynamic>> readCities = await reader.readFile();

  for (Map<String, dynamic> city in readCities) {
    cities.add(City.fromJson(city));
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Adjusts the orientation of application to portrait
  const orientations = [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown];
  SystemChrome.setPreferredOrientations(orientations);

  await readCities();

  await GetStorage.init();

  await initializeHiveCache();

  runApp(
      // EasyLocalization(
      //   supportedLocales: SupportedLocalesProperties.supportedLocales,
      //   path: SupportedLocalesProperties.localeFilesPath,
      //   fallbackLocale: SupportedLocalesProperties.fallbackLocale,
      //   assetLoader: const CodegenLoader(),
      //   child: const App(),
      // ),
      const App());
}
