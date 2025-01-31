import 'package:dumlupinargazetesi/presentation/home/view/screens/homepage.dart';
import 'package:get/get.dart';

class RoutesPages {
  static final List<GetPage> routes = [
    GetPage(
      name: '/home',
      maintainState: true,
      page: () => const Homepage(),
    ),
  ];
}
