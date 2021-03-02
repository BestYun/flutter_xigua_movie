import 'package:get/get_state_manager/get_state_manager.dart';

///滚动时,顶部显示分类
class ShowTopCategoryController extends GetxController {
  bool _isShow = false;
  bool get isShow => _isShow;

  updateShowState(bool state) {
    _isShow = state;
    update();
  }
}
