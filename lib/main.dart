import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_xigua_movie/api/api.dart';
import 'package:flutter_xigua_movie/colors/theme_colors.dart';
import 'package:flutter_xigua_movie/pages/404_page.dart';
import 'package:flutter_xigua_movie/utils/log_util.dart';
import 'package:get/route_manager.dart';

void main() {
  initLogging();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(750, 1334),
      builder: () => GetMaterialApp(
        //设置APP主题
        theme: ThemeData(
          scaffoldBackgroundColor: ThemeColors.bgColor,
          primaryColor: ThemeColors.appBarColor,
          //全局去掉水波纹highlightColor和splashColor设置为同一颜色
          splashColor: Colors.white,
          highlightColor: Colors.white,
          appBarTheme: AppBarTheme(
            elevation: 1,
          ),
          textTheme: TextTheme(
            headline1: TextStyle(color: Colors.white),
            bodyText1: TextStyle(color: Colors.white),
            bodyText2: TextStyle(color: Colors.white),
          ),
        ),

        title: "西瓜电影",
        //设置App路由管理
        getPages: AppRouter.routerList,
        unknownRoute: GetPage(name: '/404', page: () => NotFoundPage()),
      ),
    );
  }
}
