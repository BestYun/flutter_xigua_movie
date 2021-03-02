import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_xigua_movie/colors/theme_colors.dart';
import 'package:flutter_xigua_movie/model/category_item_model.dart';
import 'package:flutter_xigua_movie/pages/movie_libraries/controller/category_selected_controller.dart';
import 'package:flutter_xigua_movie/pages/movie_libraries/controller/show_top_category_controller.dart';
import 'package:get/get.dart';

class CategoryTopSelectedTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = '';
    CategotySelectedController cs = Get.find<CategotySelectedController>();
    var keys = cs.selectedMap.keys.toList();
    keys.sort();

    List<String> tiaojian = [];

    for (int key in keys) {
      CategoryItemModel itemModel = cs.selectedMap[key];
      if (itemModel.id != 0) {
        tiaojian.add(cs.selectedMap[key].categoryName);
      }
    }
    title = tiaojian.join(' . ');

    if (title.isEmpty) {
      title = '刷选条件';
    }

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
              title,
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
