import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_xigua_movie/colors/theme_colors.dart';

class HomeBodyVideoInfoItem extends StatelessWidget {
  final double width;
  HomeBodyVideoInfoItem({@required this.width});
  @override
  Widget build(BuildContext context) {
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
              color: ThemeColors.imageBgColor,
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
