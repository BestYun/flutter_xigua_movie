import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_xigua_movie/colors/theme_colors.dart';
import 'package:flutter_xigua_movie/widgets/_tab_indicator.dart';
import 'package:get/get.dart';

class HomeTitleView extends StatefulWidget {
  final List<String> tabs;
  final List<int> classIDs;
  final TabController tabController;
  final ScrollController scrollController;

  HomeTitleView({
    @required this.tabController,
    @required this.tabs,
    @required this.classIDs,
    @required this.scrollController,
  });
  @override
  _HomeTitleViewState createState() => _HomeTitleViewState();
}

class _HomeTitleViewState extends State<HomeTitleView> {
  ///背景透明度
  double appBarBackgroundColorAlpha = 0.0;

  ///默认是不显示title view的
  bool isShowAppBar = true;

  double tabHight = 50;
  double appBarHeight = Get.statusBarHeight + 50;

  bool isRefreshing = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(() {
      titleAlpha();
    });
    widget.tabController.addListener(() {
      //TabBar的监听

      if (widget.tabController.index == 0) {
        ///刷新中隐藏标题栏
        if (isRefreshing) {
          isShowAppBar = false;
        } else {
          isShowAppBar = true;
        }
        appBarBackgroundColorAlpha =
            (widget.scrollController.offset / appBarHeight).clamp(0.0, 1.0);
        setState(() {});
      } else {
        setState(() {
          appBarBackgroundColorAlpha = 1;
          isShowAppBar = true;
        });
      }
    });
  }

  void titleAlpha() {
    if (isRefreshing) {
      return;
    }
    if (widget.tabController.index != 0) {
      return;
    }

    ///频繁刷新问题
    if (widget.scrollController.offset >= 0) {
      isShowAppBar = true;

      if (appBarBackgroundColorAlpha < 1) {
        appBarBackgroundColorAlpha =
            (widget.scrollController.offset / appBarHeight).clamp(0.0, 1.0);

        setState(() {});
      }
    } else {
      if (isShowAppBar) {
        isShowAppBar = false;
        setState(() {
          appBarBackgroundColorAlpha = 0;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // 判断齐刘海

    Color appBarBgColor = ThemeColors.appBarColor
        .withAlpha((appBarBackgroundColorAlpha * 255).toInt());
    Color textColor = Colors.white;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Container(
        color: appBarBgColor,
        child: !isShowAppBar
            ? SizedBox()
            : SafeArea(
                child: Container(
                  height: tabHight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Theme(
                          data: ThemeData(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                          child: TabBar(
                            isScrollable: true,
                            labelColor: ThemeColors.textPrimaryColor,
                            unselectedLabelColor: textColor,
                            unselectedLabelStyle: TextStyle(
                              fontSize: 30.sp,
                            ),
                            labelStyle: TextStyle(
                              fontSize: 36.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            labelPadding: EdgeInsets.only(left: 12, right: 12),
                            indicator: CustomUnderlineTabIndicator(
                              // 里面自定义宽度
                              borderSide: BorderSide(
                                  width: 3, //指示条高度
                                  color: ThemeColors.textPrimaryColor),
                            ),
                            tabs: widget.tabs
                                .map((text) => Tab(
                                      text: text,
                                    ))
                                .toList(),
                            controller: widget.tabController,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
