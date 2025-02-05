import 'package:dumlupinargazetesi/generals/themes/colors.dart';
import 'package:dumlupinargazetesi/generated/assets.gen.dart';
import 'package:dumlupinargazetesi/presentation/search_page/controller/search_controller.dart';
import 'package:dumlupinargazetesi/presentation/search_page/view/widgets/search_res_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchEntryController controller = Get.find<SearchEntryController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: DumlupinarColors.whiteColor,
        body: Column(
          children: [
            Container(
              height: 80,
              padding: EdgeInsets.all(12),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: DumlupinarColors.whiteColor,
                border: Border(
                  bottom: BorderSide(
                    color: DumlupinarColors.grayColor,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 45,
                      child: TextField(
                        controller: controller.searchTxtController,
                        textInputAction: TextInputAction.search,
                        onSubmitted: (value) {
                          controller.search();
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Haberlerde ara...",
                          hintStyle: TextStyle(
                            color: DumlupinarColors.darkGrayColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          contentPadding: EdgeInsets.zero,
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(7.5),
                            child: SvgPicture.asset(
                              Assets.icons.search.path,
                              alignment: Alignment.center,
                              colorFilter: ColorFilter.mode(
                                DumlupinarColors.darkGrayColor.withValues(alpha: 0.5),
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(color: DumlupinarColors.blackColor, width: 0.75),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(color: DumlupinarColors.blackColor, width: 0.75),
                          ),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      controller.resetData();
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "iptal",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: DumlupinarColors.darkGrayColor.withValues(alpha: 0.8),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Obx(() {
                if (controller.searching.isTrue) {
                  return Center(child: const CircularProgressIndicator());
                }

                // if (controller.searchResult.isEmpty) {
                //   return Center(child: Text('no data'));
                // }

                return SingleChildScrollView(
                  controller: controller.scrollController,
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    spacing: 10,
                    children: List.generate(
                      controller.searchResult.length,
                      (index) => SearchResItem(entry: controller.searchResult[index].entry!),
                    ),
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
