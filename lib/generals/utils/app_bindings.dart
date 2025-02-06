import 'package:dumlupinargazetesi/presentation/authors/controller/authors_controller.dart';
import 'package:dumlupinargazetesi/presentation/home/controller/homepage_controller.dart';
import 'package:dumlupinargazetesi/presentation/main_screen/controllers/bottom_navigation_bar_controller.dart';
import 'package:dumlupinargazetesi/presentation/search_page/controller/search_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomePageController());
    Get.put(SearchEntryController());
    Get.put(AuthorsController());
    Get.put(BottomNavigationBarController(), permanent: true);
  }
}
