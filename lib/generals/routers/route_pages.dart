import 'package:dumlupinargazetesi/presentation/home/view/screens/homepage.dart';
import 'package:dumlupinargazetesi/presentation/post_page/view/post_detail_screen.dart';
import 'package:get/get.dart';

class RoutesPages {
  static final List<GetPage> routes = [
    GetPage(
      name: '/home',
      maintainState: true,
      page: () => const Homepage(),
    ),
    // GetPage(
    //   name: '/entry_detail',
    //   maintainState: false,
    //   arguments: {
    //     'entryDetail': null,
    //   },
    //   page: () => const PostDetailScreen(entryDetail: ),
    // ),
  ];
}
