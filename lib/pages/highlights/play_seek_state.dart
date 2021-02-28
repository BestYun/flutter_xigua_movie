import 'package:get/get_state_manager/get_state_manager.dart';

class PlaySeekState extends GetxController {
  //当前播放进度
  double _seekPos = 0;
  double get seekPos => _seekPos;

  updateState(double seekPos) {
    _seekPos = seekPos;
    update();
  }
}
