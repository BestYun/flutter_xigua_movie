import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_xigua_movie/colors/theme_colors.dart';
import 'package:flutter_xigua_movie/pages/movie_libraries/controller/show_top_category_controller.dart';
import 'package:get/get.dart';

class CategoryTopSelectedTitle extends StatefulWidget {
  @override
  _CategoryTopSelectedTitleState createState() =>
      _CategoryTopSelectedTitleState();
}

class _CategoryTopSelectedTitleState extends State<CategoryTopSelectedTitle> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //显示分类
        Get.find<ShowTopCategoryController>().updateShowState(true);
      },
      child: Container(
        color: Colors.black87,
        height: 84.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '刷选条件',
              style: TextStyle(
                fontSize: 28.sp,
                color: ThemeColors.textPrimaryColor,
              ),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: ThemeColors.textPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
