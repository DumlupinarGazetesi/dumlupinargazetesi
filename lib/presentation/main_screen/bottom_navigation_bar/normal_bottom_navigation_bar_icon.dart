import 'package:dumlupinargazetesi/generals/themes/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class NormalBottomNavigationBarIcon extends StatelessWidget {
  const NormalBottomNavigationBarIcon({
    super.key,
    required this.text,
    required this.iconPath,
    required this.selected,
    required this.iconHeight,
    required this.filledIconPath,
    this.isVideos = false,
  });

  final String text, iconPath, filledIconPath;
  final double iconHeight;
  final bool selected;
  final bool isVideos;

  @override
  Widget build(BuildContext context) {
    final Color color = selected ? DumlupinarColors.primaryColor : DumlupinarColors.blackColor;

    return SizedBox(
      height: 45,
      // width: 65,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: SvgPicture.asset(
              selected ? filledIconPath : iconPath,
              fit: BoxFit.fill,
              alignment: Alignment.center,
              height: iconHeight,
            ),
          ),
          // Expanded(
          //   child:
          Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
