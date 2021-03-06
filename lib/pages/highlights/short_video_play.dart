import 'dart:async';

import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_xigua_movie/colors/theme_colors.dart';
import 'package:flutter_xigua_movie/pages/highlights/play_seek_state.dart';
import 'package:flutter_xigua_movie/utils/log_util.dart';
import 'package:flutter_xigua_movie/widgets/custom_ui.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ShortVideoPlay extends StatefulWidget {
  final String videoUrl;
  ShortVideoPlay({@required this.videoUrl});
  @override
  _ShortVideoPlayState createState() => _ShortVideoPlayState();
}

class _ShortVideoPlayState extends State<ShortVideoPlay> {
  FijkPlayer player;
  StreamSubscription _currentPosSubs;

  ///视频总时间
  double _allTime = 0;
  bool showLoading = true;

  @override
  void initState() {
    super.initState();

    Get.put(PlaySeekState(), tag: widget.videoUrl);

    player = FijkPlayer();

    ///设置log
    FijkLog.setLevel(FijkLogLevel.Error);
    player.addListener(playerValueChanged);

    _currentPosSubs = player.onCurrentPosUpdate.listen((v) {
      if (_allTime == 0) {
        return;
      }
      double currentValue = dura2double(v);
      //当前播放进度
      double _seekPos = (currentValue / _allTime);
      Get.find<PlaySeekState>(tag: widget.videoUrl).updateState(_seekPos);
    });
    setupPlay();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.videoUrl),
      onVisibilityChanged: (VisibilityInfo info) async {
        //
        var visiblePercentage = info.visibleFraction;
        if (visiblePercentage == 1) {
          //完全显示widge才播放
          if (player.state == FijkState.paused) {
            player.start();
          } else {
            startPlay();
          }
        } else if (visiblePercentage == 0) {
          //切换tabbar或者进入后台,先暂停
          player?.pause();
        }
      },
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: FijkView(
                  player: player,
                  color: Colors.black,
                  fit: FijkFit.contain,
                  panelBuilder: (FijkPlayer _player, FijkData data,
                      BuildContext context, Size viewSize, Rect texturePos) {
                    return CustomFijkPanel(
                      player: _player,
                      buildContext: context,
                      viewSize: viewSize,
                      texturePos: texturePos,
                    );
                  },
                ),
              ),
              showLoading
                  ? LinearProgressIndicator(
                      minHeight: 1,
                      backgroundColor: ThemeColors.textPrimaryColor,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    )
                  :

                  ///进度条
                  GetBuilder<PlaySeekState>(
                      tag: widget.videoUrl,
                      builder: (c) {
                        return LinearProgressIndicator(
                          minHeight: 0.5,
                          value: c.seekPos,
                          backgroundColor: Colors.white24,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        );
                      },
                    )
            ],
          ),
          Positioned(
            bottom: 1,
            left: 0,
            right: 0,
            child: _VideoInfo(),
          ),
        ],
      ),
    );
  }

  ///使用了
  void setupPlay() async {
    await player.applyOptions(
      FijkOption()
        ..setFormatOption('flush_packets', 1)
        ..setFormatOption('analyzemaxduration', 100)
        ..setFormatOption('analyzeduration', 1) //设置播放前的探测时间 1,达到首屏秒开效果
        ..setFormatOption('framedrop', 1)
        ..setCodecOption('skip_loop_filter', 48)
        ..setPlayerOption('start-on-prepared', 1)
        ..setPlayerOption('packet-buffering', 1)
        ..setPlayerOption(
            'framedrop', 1) //跳帧处理,放CPU处理较慢时，进行跳帧处理，保证播放流程，画面和��音同步
        ..setPlayerOption('enable-accurate-seek', 1)
        ..setPlayerOption('render-wait-start', 1)
        ..setPlayerOption('find_stream_info', 1), //为0的时候播放不正常
    );

    ///屏幕常亮
    player.setOption(FijkOption.hostCategory, "request-screen-on", 1);

    ///截屏
    // await player.setOption(FijkOption.hostCategory, "enable-snapshot", 1);
    player.setLoop(0);
  }

  ///视频状态
  playerValueChanged() {
    FijkValue value = player.value;
    _allTime = dura2double(player.value.duration);
    if (value.videoRenderStart) {
      LogUtil.log('开始播放');
      setState(() {
        showLoading = false;
      });
    }
  }

  startPlay() {
    player.setDataSource(widget.videoUrl, autoPlay: true).catchError((e) {
      print("setDataSource error: $e");
    });
  }

  double dura2double(Duration d) {
    return d != null ? d.inMilliseconds.toDouble() : 0.0;
  }

  @override
  void dispose() {
    player.removeListener(playerValueChanged);
    player?.release();
    _currentPosSubs?.cancel();

    ///删掉状态
    Get.delete<PlaySeekState>(tag: widget.videoUrl);
    super.dispose();
  }
}

class _VideoInfo extends StatelessWidget {
  const _VideoInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '影视名称',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.sp,
                  ),
                ),
                Text(
                  '影视描述呀呀呀呀',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 22.sp,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: ThemeColors.textPrimaryColor,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            // height: 40,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Center(
              child: Text(
                '观看完整版本',
                style: TextStyle(
                    fontSize: 20.sp, color: ThemeColors.textPrimaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
