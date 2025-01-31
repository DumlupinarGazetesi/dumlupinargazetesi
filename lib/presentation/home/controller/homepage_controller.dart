import 'package:dumlupinargazetesi/presentation/home/view/homepage_tabs.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  RxString selectedTab = HomePageTabs.tabs.first.obs;

  changeTab(String tab) {
    selectedTab(tab);
  }
}
