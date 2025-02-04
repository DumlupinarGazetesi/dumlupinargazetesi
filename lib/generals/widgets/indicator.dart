import 'package:dumlupinargazetesi/generals/themes/colors.dart';
import 'package:flutter/material.dart';

class IndicatorsWidget extends StatelessWidget {
  const IndicatorsWidget({
    super.key,
    this.indicatorActiveColor,
    this.indicatorDeActiveColor,
    this.sliderDuration = const Duration(milliseconds: 100),
    required this.selectedIndex,
    required this.itemCount,
  });

  final int selectedIndex;
  final Duration sliderDuration;
  final Color? indicatorActiveColor;
  final Color? indicatorDeActiveColor;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: List.generate(
        itemCount,
        (index) => AnimatedContainer(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          duration: sliderDuration,
          width: index != selectedIndex ? 6 : 24,
          height: 6,
          curve: Curves.linear,
          decoration: BoxDecoration(
            color: (index != selectedIndex)
                ? indicatorDeActiveColor ?? DumlupinarColors.grayColor
                : indicatorActiveColor ?? DumlupinarColors.primaryColor,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
}
