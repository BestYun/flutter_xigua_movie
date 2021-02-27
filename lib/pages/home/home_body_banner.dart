import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeBodyBannerWidget extends StatefulWidget {
  // final List<BannerModel> _banners;

  // HomeBodyBannerWidget(this._banners);
  @override
  _HomeBodyBannerWidgetState createState() => _HomeBodyBannerWidgetState();
}

class _HomeBodyBannerWidgetState extends State<HomeBodyBannerWidget> {
  int _bannerCurrentIndex = 0;
  final List _banners = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600.w,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 0,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                // BannerModel model = widget._banners[index];
                //显示得Widget
                return GestureDetector(
                  child: _HomeBannerItem(
                      // model,
                      ),
                  onTap: () {},
                );
              },
              //当前页指示器
              itemCount: _banners.length,
              onIndexChanged: (int index) {
                setState(() {
                  _bannerCurrentIndex = index;
                });
              },
            ),
          ),
          Positioned(
            bottom: 15,
            left: 0,
            right: 0,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_banners.length, (i) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 3),
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _bannerCurrentIndex == i
                            ? Colors.white
                            : Colors.grey),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HomeBannerItem extends StatefulWidget {
  // final BannerModel _bannerModel;
  // _HomeBannerItem(this._bannerModel);
  @override
  __HomeBannerItemState createState() => __HomeBannerItemState();
}

class __HomeBannerItemState extends State<_HomeBannerItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 35, 37, 49),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: 0,
            child: CachedNetworkImage(
              imageUrl: 'http://img.cloudnear.cn/1.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 160,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF000000),
                    Color(0x00000000),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black54,
                    Color(0x00000000),
                  ],
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            child: Text(
              '柯南',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
