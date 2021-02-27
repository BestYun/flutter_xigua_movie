import 'package:flutter_xigua_movie/main_tabbar.dart';
import 'package:get/route_manager.dart';

class AppRouter {
  static final main = '/';

  static final routerList = [
    GetPage(name: main, page: () => MainTabbar()),
  ];
}
