import 'package:dumlupinargazetesi/generals/models/categories/category.dart';
import 'package:dumlupinargazetesi/generals/themes/colors.dart';
import 'package:dumlupinargazetesi/presentation/home/controller/homepage_other_tabs_controller.dart';
import 'package:dumlupinargazetesi/presentation/home/view/screens/other_tabs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenOtherTab extends StatefulWidget {
  const HomeScreenOtherTab({required this.category, super.key});

  final Category category;

  @override
  State<HomeScreenOtherTab> createState() => _HomeScreenOtherTabState();
}

class _HomeScreenOtherTabState extends State<HomeScreenOtherTab> with AutomaticKeepAliveClientMixin {
  late HomeScreenSecondaryTabsController controller;
  final Widget errorWidget = Center(child: Text("error occurred!"));

  @override
  void initState() {
    controller = Get.put(
      HomeScreenSecondaryTabsController(catId: widget.category.id),
      tag: widget.category.title,
    );

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      backgroundColor: DumlupinarColors.backgroundColor,
      primary: false,
      body: Obx(
        () {
          return SingleChildScrollView(
            controller: controller.subCatEntriesScrollCtrl,
            key: PageStorageKey<String>(widget.category.title ?? "${widget.category.id}"),
            padding: const EdgeInsets.all(15),
            child: controller.gettingCategoryEntries.value
                ? const CircularProgressIndicator()
                : controller.subCategoryEntries.isNotEmpty
                    ? CategoryEntryItems(
                        entries: controller.subCategoryEntries,
                      )
                    : Center(child: Text('no data')),
          );
        },
      ),
    );
  }
}
