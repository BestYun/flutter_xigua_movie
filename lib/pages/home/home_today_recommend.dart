import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_xigua_movie/utils/assets_image_name_utils.dart';
import 'package:get/get.dart';

///今日推荐
class HomeTodayRecommend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            children:
                List.generate(6, (index) => index).map((e) => _Item()).toList(),
            runSpacing: 10,
            spacing: 10,
          )
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = (Get.width - 30.w * 2 - 10) / 2;
    return Container(
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10.w),
            child: Container(
              height: 180.w,
              // color: Color.fromARGB(255, 26, 28, 38),
              color: Color.fromARGB(255, 35, 37, 49),
            ),
          ),
          SizedBox(height: 16.w),
          Text(
            '电影名称',
            style: TextStyle(
              fontSize: 24.sp,
              color: Colors.white,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          SizedBox(height: 2),
          Text(
            '电影描述',
            style: TextStyle(
              fontSize: 20.sp,
              color: Color.fromARGB(255, 83, 83, 83),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
