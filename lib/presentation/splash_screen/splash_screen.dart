import 'package:alp_animated_splashscreen/alp_animated_splashscreen.dart';
import 'package:dumlupinargazetesi/generals/constants/colors.dart';
import 'package:dumlupinargazetesi/generated/assets.gen.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      companyname: 'Dumlupinar Gazetesi',
      brandnamecolor: DumlupinarColors.primaryColor,
      backgroundcolor: DumlupinarColors.whiteColor,
      foregroundcolor: DumlupinarColors.primaryColor,
      logo: Assets.images.dumlupinarGazetesi.path,
      brandname: 'Dumlupinar Gazetesi',
    );
  }
}


