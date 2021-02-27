import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_xigua_movie/colors/theme_colors.dart';
import 'package:flutter_xigua_movie/pages/home/home_video_info_item.dart';

class HomeOtherBody extends StatefulWidget {
  final String item;
  HomeOtherBody({@required this.item});
  @override
  _HomeOtherBodyState createState() => _HomeOtherBodyState();
}

class _HomeOtherBodyState extends State<HomeOtherBody>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SafeArea(
          child: SizedBox(height: 50),
        ),
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverPadding(padding: EdgeInsets.only(top: 10)),
              SliverToBoxAdapter(child: _Banner()),
              SliverPadding(
                padding: EdgeInsets.all(30.w),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (c, index) {
                      return HomeBodyVideoInfoItem();
                    },
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 10 / 8,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _Banner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400.w,
        color: ThemeColors.imageBgColor,
        child: Swiper(
          viewportFraction: 0.95,
          itemBuilder: (BuildContext context, int index) {
            //显示得Widget
            return GestureDetector(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        child: CachedNetworkImage(
                          imageUrl: index % 2 == 0
                              ? 'http://img.cloudnear.cn/1.jpg'
                              : 'http://img.cloudnear.cn/2.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      // color: Colors.black12,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.w, vertical: 10.w),
                      child: Text('电影名称'),
                    ),
                  ],
                ),
              ),
              onTap: () {},
            );
          },
          //当前页指示器
          itemCount: 10,
          onIndexChanged: (int index) {},
        ));
  }
}
