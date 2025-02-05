import 'package:dumlupinargazetesi/generals/themes/colors.dart';
import 'package:dumlupinargazetesi/presentation/home/controller/homepage_controller.dart';
import 'package:dumlupinargazetesi/presentation/home/view/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageMainTabState();
}

class _HomepageMainTabState extends State<Homepage> {
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
            child: TabBarView(
              controller: _controller.tabController,
              children: _controller.homeScreenTabs,
            ),
          ),
        ],
      ),
    );
  }
}
