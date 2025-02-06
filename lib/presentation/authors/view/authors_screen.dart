import 'package:dumlupinargazetesi/generals/themes/colors.dart';
import 'package:dumlupinargazetesi/presentation/authors/controller/authors_controller.dart';
import 'package:dumlupinargazetesi/presentation/authors/view/widgets/author_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthorsScreen extends GetView<AuthorsController> {
  const AuthorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DumlupinarColors.backgroundColor,
      body: Column(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            padding: const EdgeInsets.only(top: 35, bottom: 10, left: 15),
            color: DumlupinarColors.primaryColor,
            alignment: Alignment.centerLeft,
            child: Text(
              "Yazarlar",
              style: TextStyle(
                color: DumlupinarColors.whiteColor,
                fontWeight: FontWeight.w700,
                fontSize: 22,
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.loadingAuthors.isTrue) {
                return Center(child: CircularProgressIndicator());
              }

              return SingleChildScrollView(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bugünün Makaleleri",
                          style: TextStyle(
                            color: DumlupinarColors.blackColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(height: 20),
                        ListView.separated(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => AuthorCard(author: controller.todayAuthors[index]),
                          separatorBuilder: (context, index) => SizedBox(height: 10),
                          itemCount: controller.todayAuthors.length,
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Tüm Yazarlar",
                      style: TextStyle(
                        color: DumlupinarColors.blackColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 20),
                    ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => AuthorCard(author: controller.allAuthors[index]),
                      separatorBuilder: (context, index) => SizedBox(height: 10),
                      itemCount: controller.allAuthors.length,
                    )
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
