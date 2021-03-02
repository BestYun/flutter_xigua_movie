import 'package:flutter_xigua_movie/model/category_item_model.dart';
import 'package:get/get.dart';

///记录选中分类
class CategotySelectedController extends GetxController {
  //
  Map<String, CategoryItemModel> _map = Map<String, CategoryItemModel>();
  Map<String, CategoryItemModel> get selectedMap => _map;

  setupData(Map<String, CategoryItemModel> map) {
    _map = map;
  }

  updateSelected(String key, CategoryItemModel model) {
    _map[key] = model;
    update();
  }
}
