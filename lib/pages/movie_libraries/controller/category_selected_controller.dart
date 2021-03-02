import 'package:flutter_xigua_movie/model/category_item_model.dart';
import 'package:get/get.dart';

///记录选中分类
class CategotySelectedController extends GetxController {
  //
  Map<int, CategoryItemModel> _map = Map<int, CategoryItemModel>();
  Map<int, CategoryItemModel> get selectedMap => _map;

  setupData(Map<int, CategoryItemModel> map) {
    _map = map;
  }

  updateSelected(int key, CategoryItemModel model) {
    _map[key] = model;
    update();
  }
}
