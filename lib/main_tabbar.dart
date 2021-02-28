import 'package:flutter/material.dart';
import 'package:flutter_xigua_movie/colors/theme_colors.dart';
import 'package:flutter_xigua_movie/pages/highlights/highlights_page.dart';
import 'package:flutter_xigua_movie/pages/home/home_page.dart';
import 'package:flutter_xigua_movie/pages/mine/mine_page.dart';
import 'package:flutter_xigua_movie/pages/movie_libraries/movie_libraries_page.dart';
import 'package:flutter_xigua_movie/pages/ranking_list/ranking_list_page.dart';

class MainTabbar extends StatefulWidget {
  @override
  _MainTabbarState createState() => _MainTabbarState();
}

class _MainTabbarState extends State<MainTabbar> {
  final List<String> titles = [
    '首页',
    '精彩片段',
    '排行榜',
    '片库',
    '我的',
  ];
  List<Widget> _pages = [
    HomePage(),
    HighlightsPage(),
    RankingListPage(),
    MovieLibrariesPage(),
    MinePage(),
  ];

  final pageController = PageController();

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void onTap(int index) {
    if (currentIndex == index) {
      return;
    }
    currentIndex = index;

    pageController.jumpToPage(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: _pages,
        physics: NeverScrollableScrollPhysics(), // 禁止滑动
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          brightness: Brightness.light,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          iconSize: 20,
          selectedFontSize: 12,
          selectedItemColor: ThemeColors.textPrimaryColor,
          unselectedFontSize: 12,
          unselectedItemColor: Colors.white30,
          backgroundColor: ThemeColors.tabbarColor,
          type: BottomNavigationBarType.fixed,
          items: bottomBarItem(),
          currentIndex: currentIndex,
          onTap: onTap,
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> bottomBarItem() {
    List<BottomNavigationBarItem> data = [];
    for (int i = 0; i < titles.length; i++) {
      String title = titles[i];

      BottomNavigationBarItem item = BottomNavigationBarItem(
        label: title,
        icon: Icon(
          Icons.home,
        ),
        activeIcon: Icon(
          Icons.home,
        ),
      );
      data.add(item);
    }

    return data;
  }
}
