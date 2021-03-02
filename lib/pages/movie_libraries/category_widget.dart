import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_xigua_movie/colors/theme_colors.dart';
import 'package:flutter_xigua_movie/model/category_item_model.dart';
import 'package:flutter_xigua_movie/pages/movie_libraries/controller/category_selected_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

///分类信息
class CategoryWidget extends StatelessWidget {
  final List<List<CategoryItemModel>> data;
  CategoryWidget({@required this.data});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetBuilder<CategotySelectedController>(
        builder: (CategotySelectedController c) => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(data.length, (index) => index)
              .map(
                (item) => Container(
                  height: 60.w,
                  margin: EdgeInsets.only(bottom: 10),
                  color: Colors.transparent,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (bc, index) {
                      List<CategoryItemModel> items = data[item];
                      CategoryItemModel model = items[index];
                      String key = item.toString();
                      CategoryItemModel selectedModel = c.selectedMap[key];

                      return GestureDetector(
                        onTap: () {
                          //
                          c.updateSelected(key, model);
                        },
                        child: _TextItem(
                          isSelected: selectedModel.id == model.id,
                          itemTitle: model.categoryName,
                        ),
                      );
                    },
                    itemCount: data[item].length,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class _TextItem extends StatelessWidget {
  final String itemTitle;
  final bool isSelected;
  _TextItem({this.itemTitle, this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: isSelected ? ThemeColors.imageBgColor : Colors.transparent,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          itemTitle,
          style: TextStyle(
            color: isSelected ? ThemeColors.textPrimaryColor : Colors.white38,
          ),
        ),
      ),
    );
  }
}
