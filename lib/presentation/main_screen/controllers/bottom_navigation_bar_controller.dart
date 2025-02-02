import 'package:dumlupinargazetesi/generals/constants/generated_translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';

class BottomNavigationBarController extends GetxController {
  RxInt page = 0.obs;

  set changePage(pageNumber) => page(pageNumber);
  // set changePage(pageNumber) => pgCtrl.jumpToPage(pageNumber);

  get currentPage => page.value;

  DateTime? currentBackPressTime;

  // PageController pgCtrl = PageController(
  //   viewportFraction: 1,
  //   initialPage: 0,
  //   keepPage: true,
  // );

  _exitFromApp() {
    DateTime now = DateTime.now(); // Get the current time
    if (currentBackPressTime == null || now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      // If the user has not pressed back before or the interval is more than 2 seconds
      currentBackPressTime = now; // Update the last back press time
      Get.showSnackbar(
        GetSnackBar(
          message: tr(LocaleKeys.press_back_to_exit),
          duration: const Duration(seconds: 2),
        ),
      );

      return false; // Return false to cancel the pop
    }
    return true;
  }

  pressBack() {
    if (page.value != 0) {
      changePage = 0;
      return false;
    } else {
      return _exitFromApp();
    }
  }
}
