import 'package:flutter/material.dart';
import 'package:flutter_xigua_movie/pages/home/home_body.dart';
import 'package:flutter_xigua_movie/pages/home/home_othoer_body.dart';
import 'package:flutter_xigua_movie/pages/home/home_title_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  final List<String> tabs = ["精选", "动作", "喜剧", "科幻", '爱情', '嫌疑', '纪录片'];
  List<int> classIDs;
  TabController _tabController;
  ScrollController scrollController;

  final pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  bool isPageCanChanged = true;

  @override
  void initState() {
    classIDs = List.generate(tabs.length, (index) => index);

    scrollController = ScrollController();

    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      //TabBar的监听
      if (_tabController.indexIsChanging) {
        onPageChange(_tabController.index, p: pageController);
      }
      if (_tabController.index == 0) {
      } else {}
    });

    super.initState();
  }

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Stack(children: [
        PageView(
          children: List.generate(tabs.length, (index) => index).map(
            (index) {
              return index == 0
                  ? HomeBody(
                      scrollController: scrollController,
                    )
                  : HomeOtherBody(item: tabs[index]);
            },
          ).toList(),
          controller: pageController,
          onPageChanged: (index) {
            if (isPageCanChanged) {
              //由于pageview切换是会回调这个方法,又会触发切切换tabbar的操作,所以定义一个flag,控制pageview的回调
              onPageChange(index);
            }
          },
        ),
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: HomeTitleView(
            classIDs: classIDs,
            tabController: _tabController,
            tabs: tabs,
            scrollController: scrollController,
          ),
        ),
      ]),
    );
  }

  onPageChange(int index, {PageController p, TabController t}) async {
    if (p != null) {
      //判断是哪一个切换
      isPageCanChanged = false;
      await pageController.animateToPage(index,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease); //等待pageview切换完毕,再释放pageivew监听
      isPageCanChanged = true;
    } else {
      _tabController.animateTo(index); //切换Tabbar
    }
  }
}
