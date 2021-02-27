import 'package:flutter/material.dart';
import 'package:flutter_xigua_movie/pages/home/home_body_banner.dart';
import 'package:flutter_xigua_movie/pages/home/home_today_recommend.dart';

class HomeBody extends StatefulWidget {
  final ScrollController scrollController;
  HomeBody({this.scrollController});

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomScrollView(
      controller: widget.scrollController,
      slivers: [
        SliverToBoxAdapter(child: HomeBodyBannerWidget()),
        SliverToBoxAdapter(child: HomeTodayRecommend()),

        // SliverList(
        //   delegate: SliverChildBuilderDelegate(
        //     (c, index) {
        //       return
        //     },
        //     childCount: 1,
        //   ),
        // ),
      ],
    );
  }
}
