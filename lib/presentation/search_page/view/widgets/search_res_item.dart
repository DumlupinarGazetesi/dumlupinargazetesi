import 'package:dumlupinargazetesi/generals/models/entry/entry_model.dart';
import 'package:dumlupinargazetesi/generals/themes/colors.dart';
import 'package:dumlupinargazetesi/generals/themes/shadows.dart';
import 'package:dumlupinargazetesi/generals/utils/navigation.dart';
import 'package:dumlupinargazetesi/presentation/post_page/view/post_detail_screen.dart';
import 'package:flutter/material.dart';

class SearchResItem extends StatelessWidget {
  const SearchResItem({super.key, required this.entry});

  final Entry entry;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: InkWell(
        onTap: () {
          Navigation.rightToLeft(
            context,
            PostDetailScreen(
              entryDetail: entry,
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
              color: DumlupinarColors.whiteColor,
              border: Border.all(color: DumlupinarColors.tintColor),
              boxShadow: DumlupinarShadows.darkShadow,
              borderRadius: BorderRadius.circular(5)),
          padding: EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 100,
                child: Image.network(
                  entry.image?.url ?? '',
                  errorBuilder: (context, _, __) {
                    return Center(child: Icon(Icons.error_outline));
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      entry.title ?? '',
                      style: TextStyle(
                        color: DumlupinarColors.darkGrayColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: List.generate(
                        entry.categories?.length ?? 0,
                        (index) {
                          return Text(
                            "# ${entry.categories?[index].title}".toUpperCase(),
                            style: TextStyle(
                                color: DumlupinarColors.primaryColor, fontSize: 12, fontWeight: FontWeight.w500),
                          );
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
