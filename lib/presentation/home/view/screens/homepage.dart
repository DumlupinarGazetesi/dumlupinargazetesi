import 'package:dumlupinargazetesi/generals/constants/colors.dart';
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
          const SizedBox(height: 10),
          AdsSection(),
          const SizedBox(height: 10),
          WeatherWidget(),
          const SizedBox(height: 10),

          ExchangeWidget(),
          // EntriesCarousel(),
          Expanded(
            child: TextButton(
                onPressed: () {
                  _controller.getAdvertisements();
                },
                child: Text("push me")),
          )
        ],
      ),
    );
  }
}
