import 'package:dumlupinargazetesi/presentation/dumlupinar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';

import 'generals/constants/generated_translations/codegen_loader.g.dart';
import 'generals/constants/supported_locales_properties.dart';

late final HiveCacheStore hiveCacheStore;

initializeHiveCache() async {
  dynamic tempDir = await getTemporaryDirectory();
  hiveCacheStore = HiveCacheStore(tempDir.path);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Adjusts the orientation of application to portrait
  const orientations = [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown];
  SystemChrome.setPreferredOrientations(orientations);

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
      const App()
  );
}
