import 'package:dumlupinargazetesi/generals/models/entry/entry_model.dart';
import 'package:dumlupinargazetesi/generals/themes/colors.dart';
import 'package:dumlupinargazetesi/generals/utils/date_converter.dart';
import 'package:dumlupinargazetesi/generals/utils/navigation.dart';
import 'package:dumlupinargazetesi/presentation/post_page/view/post_detail_screen.dart';
import 'package:flutter/material.dart';

class AuthorEntryCard extends StatelessWidget {
  const AuthorEntryCard({super.key, required this.entry});

  final Entry entry;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Text(
              entry.title ?? '',
              style: TextStyle(
                color: DumlupinarColors.blackColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              DateUtil.formatTurkishDateWithDay(entry.publishedAt!),
              style: TextStyle(
                fontSize: 12,
                color: DumlupinarColors.grayColor,
              ),
            )
          ],
        ),
        IconButton(
          onPressed: () {
            Navigation.rightToLeft(
              context,
              PostDetailScreen(entryDetail: entry),
            );
          },
          icon: Icon(
            Icons.arrow_forward_ios,
            color: DumlupinarColors.blackColor,
          ),
        )
      ],
    );
  }
}
