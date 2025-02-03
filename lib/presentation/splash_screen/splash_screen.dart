import 'package:dumlupinargazetesi/generals/themes/colors.dart';
import 'package:dumlupinargazetesi/generals/widgets/animated_splash_screen.dart';
import 'package:dumlupinargazetesi/generated/assets.gen.dart';
import 'package:dumlupinargazetesi/presentation/main_screen/view/main_screen.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      companyName: 'Dumlupinar Gazetesi',
      brandNameColor: DumlupinarColors.primaryColor,
      backgroundColor: DumlupinarColors.whiteColor,
      foregroundColor: DumlupinarColors.primaryColor,
      logo: Assets.images.dumlupinarGazetesi.path,
      brandName: 'Dumlupinar Gazetesi',
      child: MainScreen(),
    );
  }
}





