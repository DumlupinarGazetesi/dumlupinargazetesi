import 'package:dumlupinargazetesi/generals/models/authors/author.dart';
import 'package:dumlupinargazetesi/generals/themes/colors.dart';
import 'package:dumlupinargazetesi/generals/utils/navigation.dart';
import 'package:dumlupinargazetesi/presentation/authors/view/author_entries_screen.dart';
import 'package:flutter/material.dart';
import 'package:dumlupinargazetesi/generals/themes/shadows.dart';
import 'package:dumlupinargazetesi/generated/assets.gen.dart';

class AuthorCard extends StatelessWidget {
  const AuthorCard({super.key, required this.author});

  final Author author;

  @override
  Widget build(BuildContext context) {
    if (author.entries?.isEmpty ?? true) return SizedBox.shrink();

    return IntrinsicHeight(
      child: GestureDetector(
        onTap: () => Navigation.rightToLeft(
          context,
          AuthorEntriesScreen(author: author),
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: DumlupinarColors.whiteColor,
            boxShadow: DumlupinarShadows.darkShadow,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        // shape: BoxShape.circle,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: DumlupinarColors.greyColor,
                        )),
                    child: author.avatar != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(
                              height: 100,
                              width: 100,
                              author.avatar ?? '',
                              alignment: Alignment.topCenter,
                            ),
                          )
                        : Image.asset(
                            height: 50,
                            width: 50,
                            Assets.images.user.path,
                            color: DumlupinarColors.greyColor,
                            alignment: Alignment.center,
                          ),
                  ),
                  SizedBox(height: 5),
                  SizedBox(
                    width: 110,
                    child: Text(
                      "${author.firstName}" " " "${author.lastName}".toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: DumlupinarColors.primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Text(
                  author.entries?.first.title ?? '',
                  style: TextStyle(
                    color: DumlupinarColors.blackColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
