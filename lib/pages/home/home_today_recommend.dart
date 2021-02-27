import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_xigua_movie/colors/theme_colors.dart';
import 'package:flutter_xigua_movie/pages/home/home_video_info_item.dart';
import 'package:flutter_xigua_movie/utils/assets_image_name_utils.dart';
import 'package:get/get.dart';

///今日推荐
class HomeTodayRecommend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemWidth = (Get.width - 30.w * 2 - 10) / 2;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                '今日推荐',
                style: TextStyle(fontSize: 30.sp, color: Colors.white),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  print('change data');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      getAssetsImageName('change'),
                      width: 24.w,
                      height: 24.w,
                    ),
                    SizedBox(width: 4),
                    Text(
                      '换一批',
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.grey[300],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.w),
          Wrap(
            children: List.generate(6, (index) => index)
                .map((e) => HomeBodyVideoInfoItem(
                      width: itemWidth,
                    ))
                .toList(),
            runSpacing: 10,
            spacing: 10,
          )
        ],
      ),
    );
  }
}
