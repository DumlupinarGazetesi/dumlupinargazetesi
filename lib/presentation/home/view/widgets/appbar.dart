import 'package:dumlupinargazetesi/generals/models/categories/category.dart';
import 'package:dumlupinargazetesi/generals/utils/navigation.dart';
import 'package:dumlupinargazetesi/presentation/home/controller/homepage_controller.dart';
import 'package:dumlupinargazetesi/presentation/search_page/view/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dumlupinargazetesi/generals/themes/colors.dart';
import 'package:dumlupinargazetesi/generated/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePageAppbar extends GetView<HomePageController> {
  const HomePageAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5).copyWith(top: 35),
        color: DumlupinarColors.primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTopBar(context),
            _buildTabs(),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildMenuLogo(),
        Row(
          children: [
            _buildIconButton(
              Assets.icons.search.path,
              () {
                Navigation.bottomToTop(context, SearchScreen());
              },
            ),
            // _buildIconButton(Assets.icons.user.path, () {}),
          ],
        ),
      ],
    );
  }

  Widget _buildMenuLogo() {
    return Row(
      children: [
        GestureDetector(
          child: SizedBox(
            height: 30,
            width: 35,
            child: SvgPicture.asset(
              Assets.icons.menus.path,
              alignment: Alignment.center,
            ),
          ),
        ),
        const SizedBox(width: 7.5),
        Image.asset(
          Assets.images.dumlupinarGazetesi.path,
          height: 30,
        ),
      ],
    );
  }

  Widget _buildIconButton(String assetPath, VoidCallback onPressed) {
    return SizedBox(
      height: 40,
      width: 40,
      child: IconButton(
        icon: SvgPicture.asset(assetPath),
        color: Colors.white,
        onPressed: onPressed,
      ),
    );
  }

  Widget _buildTabs() {
    final List<Category>? cats = controller.categories;
    return Obx(
      () {
        debugPrint("++++ ${controller.selectedCategory.value}");
        return SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cats?.length,
            itemBuilder: (context, index) => _buildTabItem(index),
          ),
        );
      },
    );
  }

  Widget _buildTabItem(int index) {
    Category? item = controller.categories?[index];

    final bool isSelected = controller.selectedCategory.value.id == item?.id;
    return GestureDetector(
      onTap: () => controller.changeTab = item!,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border(
            bottom: isSelected
                ? BorderSide(
                    color: DumlupinarColors.whiteColor,
                    width: 2,
                  )
                : BorderSide.none,
          ),
        ),
        child: Text(
          item?.title ?? '',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: DumlupinarColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
