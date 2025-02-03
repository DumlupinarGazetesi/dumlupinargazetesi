import 'package:dumlupinargazetesi/generals/themes/colors.dart';
import 'package:dumlupinargazetesi/generals/widgets/entries_carousel.dart';
import 'package:dumlupinargazetesi/generals/widgets/exchange_widget.dart';
import 'package:dumlupinargazetesi/generals/widgets/weather_widget.dart';
import 'package:dumlupinargazetesi/presentation/home/controller/homepage_controller.dart';
import 'package:dumlupinargazetesi/presentation/home/view/widgets/ads_section.dart';
import 'package:dumlupinargazetesi/presentation/home/view/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final HomePageController _controller = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DumlupinarColors.backgroundColor,
      body: Column(
        children: [
          HomePageAppbar(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  AdsSection(),
                  const SizedBox(height: 10),
                  WeatherWidget(),
                  const SizedBox(height: 10),
                  Obx(() {
                    if (_controller.isGettingCovers.isTrue) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (_controller.simpleCovers == null || _controller.simpleCovers!.isEmpty) {
                      return const Center(child: Text('No data'));
                    }

                    return EntriesCarousel(entries: _controller.simpleCovers);
                  }),
                  const SizedBox(height: 10),
                  ExchangeWidget(),
                  const SizedBox(height: 10),
                  Obx(() {
                    if (_controller.isGettingFeaturedCovers.isTrue) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (_controller.featuredCovers == null || _controller.featuredCovers!.isEmpty) {
                      return const Center(child: Text('No data'));
                    }

                    return EntriesCarousel(entries: _controller.featuredCovers);
                  }),
                  const SizedBox(height: 10),
                  Obx(() {
                    if (_controller.isGettingTopCovers.isTrue) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (_controller.topCovers == null || _controller.topCovers!.isEmpty) {
                      return const Center(child: Text('No data'));
                    }

                    return EntriesCarousel(entries: _controller.topCovers);
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
