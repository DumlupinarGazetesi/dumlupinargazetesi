import 'package:dumlupinargazetesi/generals/themes/colors.dart';
import 'package:dumlupinargazetesi/generals/routers/route_pages.dart';
import 'package:dumlupinargazetesi/generals/utils/app_bindings.dart';
import 'package:dumlupinargazetesi/presentation/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      useInheritedMediaQuery: true,
      title: 'Dumlupinar Gazetesi',
      getPages: RoutesPages.routes,
      initialBinding: AppBinding(),
      // localizationsDelegates: context.localizationDelegates,
      // supportedLocales: context.supportedLocales,
      // locale: context.locale,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: DumlupinarColors.primaryColor),
        useMaterial3: true,
      ),
      home: const Splashscreen(),
    );
  }
}
