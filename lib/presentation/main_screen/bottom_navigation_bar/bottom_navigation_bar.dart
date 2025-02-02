import 'package:dumlupinargazetesi/generals/constants/colors.dart';
import 'package:dumlupinargazetesi/generals/constants/generated_translations/locale_keys.g.dart';
import 'package:dumlupinargazetesi/generated/assets.gen.dart';
import 'package:dumlupinargazetesi/presentation/main_screen/controllers/bottom_navigation_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'normal_bottom_navigation_bar_icon.dart';

class MarkabuBottomNavigationBar extends GetView<BottomNavigationBarController> {
  const MarkabuBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () {
          return Container(
            height: 60,
            width: Get.width,
            decoration: BoxDecoration(
              color: DumlupinarColors.whiteColor,
              border: Border.symmetric(
                horizontal: BorderSide(
                  color: DumlupinarColors.greyColor,
                ),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: items()
                  .map(
                    (e) => Expanded(
                      child: Center(child: e),
                    ),
                  )
                  .toList(),
            ),
          );
        },
      ),
    );
  }

  List<Widget> items() => [
        InkWell(
          onTap: () async {
            controller.changePage = 0;
          },
          child: NormalBottomNavigationBarIcon(
            text: LocaleKeys.home,
            iconPath: Assets.icons.home.path,
            filledIconPath: Assets.icons.filledHome.path,
            selected: controller.currentPage == 0,
            iconHeight: 25,
          ),
        ),
        InkWell(
          onTap: () => controller.changePage = 1,
          child: NormalBottomNavigationBarIcon(
            text: LocaleKeys.authors,
            filledIconPath: Assets.icons.authorsFilled.path,
            iconPath: Assets.icons.authors.path,
            selected: controller.currentPage == 1,
            iconHeight: 25,
          ),
        ),
      ];
}
