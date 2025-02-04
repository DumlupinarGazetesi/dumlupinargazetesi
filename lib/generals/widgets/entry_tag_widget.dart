
import 'package:dumlupinargazetesi/generals/themes/colors.dart';
import 'package:flutter/material.dart';

class EntryTagWidget extends StatelessWidget {
  const EntryTagWidget({super.key, required this.tagTitle});

  final String tagTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: DumlupinarColors.primaryColor.withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(5),
      ),
      alignment: Alignment.center,
      child: Text(
        tagTitle.toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}