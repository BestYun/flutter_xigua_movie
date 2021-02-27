import 'package:flutter/material.dart';
import 'package:flutter_xigua_movie/pages/home/home_body_banner.dart';

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
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (c, index) {
              return HomeBodyBannerWidget();
            },
            childCount: 1,
          ),
        ),
      ],
    );
  }
}
