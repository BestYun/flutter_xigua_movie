import 'package:get/get_state_manager/get_state_manager.dart';

///显示刷选条件
class CategoryShowTopTitleController extends GetxController {
  bool _isShow = false;
  bool get isShow => _isShow;

  updateShowState(bool state) {
    _isShow = state;
    update();
  }
}
