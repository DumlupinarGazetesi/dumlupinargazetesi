import 'package:dumlupinargazetesi/presentation/home/controller/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:dumlupinargazetesi/generals/widgets/entries_carousel.dart';
import 'package:dumlupinargazetesi/generals/widgets/exchange_widget.dart';
import 'package:dumlupinargazetesi/generals/widgets/weather_widget.dart';
import 'package:dumlupinargazetesi/presentation/home/view/widgets/ads_section.dart';
import 'package:get/get.dart';

class HomeScreenMainTab extends GetView<HomePageController> {
  const HomeScreenMainTab({super.key});

  @override
  Widget build(BuildContext context) {
    return   Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            AdsSection(),
            const SizedBox(height: 10),
            WeatherWidget(),
            const SizedBox(height: 10),
            Obx(() {
              if (controller.isGettingCovers.isTrue) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.simpleCovers == null || controller.simpleCovers!.isEmpty) {
                return const Center(child: Text('No data'));
              }

              return EntriesCarousel(entries: controller.simpleCovers);
            }),
            const SizedBox(height: 10),
            ExchangeWidget(),
            const SizedBox(height: 10),
            Obx(() {
              if (controller.isGettingFeaturedCovers.isTrue) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.featuredCovers == null || controller.featuredCovers!.isEmpty) {
                return const Center(child: Text('No data'));
              }

              return EntriesCarousel(entries: controller.featuredCovers);
            }),
            const SizedBox(height: 10),
            Obx(() {
              if (controller.isGettingTopCovers.isTrue) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.topCovers == null || controller.topCovers!.isEmpty) {
                return const Center(child: Text('No data'));
              }

              return EntriesCarousel(entries: controller.topCovers);
            }),
          ],
        ),
      ),
    );
  }
}
