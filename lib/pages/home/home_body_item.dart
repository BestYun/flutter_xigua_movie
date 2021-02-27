import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_xigua_movie/colors/theme_colors.dart';
import 'package:flutter_xigua_movie/pages/home/home_video_info_item.dart';
import 'package:flutter_xigua_movie/utils/assets_image_name_utils.dart';
import 'package:get/get.dart';

class HomeBodyItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 30.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //
          Text(
            '分类推荐',
            style: TextStyle(fontSize: 30.sp, color: Colors.white),
          ),
          _CoverItem(),
          _Content(),
          SizedBox(height: 20.w),
          _ToolBar(),
        ],
      ),
    );
  }
}

class _CoverItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.w),
      child: Stack(children: [
        Container(
          height: 260.w,
          color: ThemeColors.imageBgColor,
        ),
        Positioned(
          bottom: 20.w,
          left: 20.w,
          child: Text(
            '电影名称',
            style: TextStyle(
              fontSize: 24.sp,
              color: Colors.white,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        )
      ]),
    );
  }
}

class _Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemWidth = (Get.width - 30.w * 2 - 10) / 2;
    return Wrap(
      children: List.generate(6, (index) => index)
          .map((e) => HomeBodyVideoInfoItem(
                width: itemWidth,
              ))
          .toList(),
      runSpacing: 10,
      spacing: 10,
    );
  }
}

class _ToolBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: _ToolBarItem(
              iconName: 'icon-more-tv@3x',
              title: '更多',
              itemOnClick: () {
                print('更多');
              },
            ),
          ),
          SizedBox(
            width: 18.w,
          ),
          Expanded(
            child: _ToolBarItem(
              iconName: 'icon-Change@3x',
              title: '换一批',
              itemOnClick: () {
                print('换一批');
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ToolBarItem extends StatelessWidget {
  final VoidCallback itemOnClick;
  final String title;
  final String iconName;
  const _ToolBarItem({
    Key key,
    this.itemOnClick,
    @required this.iconName,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: itemOnClick,
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 35, 37, 49),
          borderRadius: BorderRadius.circular(6),
        ),
        height: 70.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              getAssetsImageName(iconName),
              width: 28.w,
              height: 28.w,
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 24.sp,
                color: Colors.white38,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
