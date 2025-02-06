import 'package:dumlupinargazetesi/generals/models/authors/author.dart';
import 'package:dumlupinargazetesi/generals/themes/colors.dart';
import 'package:dumlupinargazetesi/generals/widgets/author_entry_card.dart';
import 'package:dumlupinargazetesi/generals/widgets/secondary_app_bar.dart';
import 'package:dumlupinargazetesi/presentation/authors/controller/authors_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthorEntriesScreen extends StatefulWidget {
  const AuthorEntriesScreen({super.key, required this.author});

  final Author author;

  @override
  State<AuthorEntriesScreen> createState() => _AuthorEntriesScreenState();
}

class _AuthorEntriesScreenState extends State<AuthorEntriesScreen> {
  final AuthorsController _controller = Get.find<AuthorsController>();

  @override
  void initState() {
    _controller.getAuthorEntries(authorId: widget.author.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: DumlupinarColors.backgroundColor,
        body: Column(
          children: [
            SecondaryAppBar(shareData: ''),
            Expanded(
              child: Obx(() {
                if (_controller.loadingAuthorEntries.isTrue) {
                  return Center(child: CircularProgressIndicator());
                }

                return SingleChildScrollView(
                  controller: _controller.scrollController,
                  padding: EdgeInsets.all(10).copyWith(top: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: DumlupinarColors.greyColor,
                            ),
                          ),
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              height: 100,
                              decoration: BoxDecoration(
                                color: DumlupinarColors.primaryColor,
                                borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(5),
                                ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(75),
                              child: Image.network(
                                widget.author.avatar!,
                                height: 150,
                                width: 150,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "${widget.author.firstName}" " " "${widget.author.lastName}",
                                style: TextStyle(
                                  color: DumlupinarColors.blackColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 22,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Yazarin Tum Yazilari",
                        style: TextStyle(
                          color: DumlupinarColors.blackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 15),
                      ListView.separated(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => AuthorEntryCard(
                          entry: _controller.authorEntries[index],
                        ),
                        separatorBuilder: (context, index) => Divider(
                          color: DumlupinarColors.greyColor.withValues(alpha: .5),
                          thickness: .75,
                          height: 2,
                        ),
                        itemCount: _controller.authorEntries.length,
                      )
                    ],
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
