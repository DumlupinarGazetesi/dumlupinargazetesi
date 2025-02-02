import 'package:dumlupinargazetesi/generals/constants/colors.dart';
import 'package:flutter/material.dart';

class IndicatorsWidget extends StatelessWidget {
  const IndicatorsWidget({
    super.key,
    this.indicatorActiveColor,
    this.indicatorDeActiveColor,
    this.sliderDuration = const Duration(milliseconds: 100),
    required this.properties,
    required this.actualIndex,
  });

  final int actualIndex;
  final Duration sliderDuration;
  final Color? indicatorActiveColor;
  final Color? indicatorDeActiveColor;
  final List properties;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: properties.asMap().entries.map((entire) {
        return AnimatedContainer(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          duration: sliderDuration,
          width: entire.key != actualIndex ? 6 : 24,
          height: 6,
          curve: Curves.linear,
          decoration: BoxDecoration(
            color: (entire.key != actualIndex)
                ? indicatorDeActiveColor ?? DumlupinarColors.grayColor
                : indicatorActiveColor ?? DumlupinarColors.primaryColor,
            borderRadius: BorderRadius.circular(50),
          ),
        );
      }).toList(),
    );
  }
}
