import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_xigua_movie/colors/theme_colors.dart';
import 'package:flutter_xigua_movie/pages/ranking_list/ranking_content.dart';
import 'package:flutter_xigua_movie/utils/log_util.dart';
import 'package:flutter_xigua_movie/widgets/_tab_indicator.dart';

///排行榜,包括热播榜
class RankingListPage extends StatefulWidget {
  @override
  _RankingListPageState createState() => _RankingListPageState();
}

class _RankingListPageState extends State<RankingListPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;

  List<String> tabs = [
    "热播榜",
    "電影",
    "電視劇",
  ];
  List<int> classIDs = [0, 1, 2];
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: tabs.length, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: topTitle(),
      ),
      body: TabBarView(
        children: classIDs.map(
          (index) {
            return RankingContent(
              content: tabs[index],
            );
          },
        ).toList(),
        controller: _tabController,
        // onPageChanged: (index) {
        //   if (isPageCanChanged) {
        //     onPageChange(index);
        //   }
        // },
      ),
    );
  }

  Widget topTitle() => Container(
        padding: EdgeInsets.only(right: 30.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Theme(
                data: ThemeData(
                  brightness: Brightness.light,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                child: TabBar(
                  isScrollable: true,
                  labelColor: ThemeColors.textPrimaryColor,
                  unselectedLabelColor: Colors.white38,
                  unselectedLabelStyle: TextStyle(
                    fontSize: 36.sp,
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
                      color: ThemeColors.textPrimaryColor,
                    ),
                  ),
                  tabs: tabs
                      .map((text) => Tab(
                            text: text,
                          ))
                      .toList(),
                  controller: _tabController,
                ),
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
          ],
        ),
      );
}
