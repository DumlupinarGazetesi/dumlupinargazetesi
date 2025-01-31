import 'package:dumlupinargazetesi/generals/routers/route_pages.dart';
import 'package:dumlupinargazetesi/generals/utils/app_bindings.dart';
import 'package:dumlupinargazetesi/presentation/home/view/screens/homepage.dart';
import 'package:easy_localization/easy_localization.dart';
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        useMaterial3: true,
      ),
      home: const Homepage(),
    );
  }
}
