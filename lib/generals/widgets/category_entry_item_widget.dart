import 'package:dumlupinargazetesi/generals/models/entry/entry_model.dart';
import 'package:dumlupinargazetesi/generals/themes/colors.dart';
import 'package:dumlupinargazetesi/generals/themes/shadows.dart';
import 'package:dumlupinargazetesi/generals/utils/date_converter.dart';
import 'package:dumlupinargazetesi/generals/utils/navigation.dart';
import 'package:dumlupinargazetesi/presentation/post_page/view/post_detail_screen.dart';
import 'package:flutter/material.dart';

class CatEntryItemWidget extends StatelessWidget {
  const CatEntryItemWidget({super.key, required this.entry});

  final Entry entry;

  @override
  Widget build(BuildContext context) {
    String image = entry.image?.large ?? '';
    if (!image.startsWith("https:")) image = "https:$image";

    return IntrinsicHeight(
      child: GestureDetector(
        onTap: () {

          Navigation.rightToLeft(
            context,
            PostDetailScreen(entryDetail: entry),
          );
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: DumlupinarColors.whiteColor,
              boxShadow: DumlupinarShadows.darkShadow),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10),
                  ),
                  image: DecorationImage(
                    alignment: Alignment.topCenter,
                    fit: BoxFit.cover,
                    image: NetworkImage(image),
                    onError: (context, st) {},
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  spacing: 10,
                  children: [
                    Row(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            entry.title ?? '',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Text(
                          DateUtil.formatTurkishDate(entry.publishedAt.toString()),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: DumlupinarColors.blackColor.withValues(alpha: 0.9),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      entry.description ?? '',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: DumlupinarColors.blackColor.withValues(alpha: 0.9),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
