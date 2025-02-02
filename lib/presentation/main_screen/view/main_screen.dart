import 'package:dumlupinargazetesi/generals/constants/colors.dart';
import 'package:dumlupinargazetesi/presentation/authors/view/authors_screen.dart';
import 'package:dumlupinargazetesi/presentation/home/view/screens/homepage.dart';
import 'package:dumlupinargazetesi/presentation/main_screen/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:dumlupinargazetesi/presentation/main_screen/controllers/bottom_navigation_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MainScreen extends GetView<BottomNavigationBarController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DumlupinarColors.backgroundColor,
      bottomNavigationBar: const MarkabuBottomNavigationBar(),
      body: PopScope(
        onPopInvokedWithResult: (didPop, dynamic) {
          if (!didPop) {
            bool getBack = controller.pressBack();

            // Exit from app
            if (getBack) SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          }

          return;
        },
        canPop: false,
        child: Obx(
          () => IndexedStack(
            sizing: StackFit.expand,
            index: controller.page.value,
            children: const [Homepage(), AuthorsScreen()],
          ),
        ),

        // child: PageView(
        //   onPageChanged: (page) {
        //     controller.page(page);
        //   },
        //   controller: controller.pgCtrl,
        //   physics: const NeverScrollableScrollPhysics(),
        //   children: const [
        //     HomeScreen(),
        //   ],
        // ),
      ),
    );
  }
}
