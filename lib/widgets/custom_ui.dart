import 'dart:math';

import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// https://fijkplayer.befovy.com/docs/zh/custom-ui.html#%E6%97%A0%E7%8A%B6%E6%80%81-ui-
Widget simplestUI(
    FijkPlayer player, BuildContext context, Size viewSize, Rect texturePos) {
  Rect rect = Rect.fromLTRB(
      max(0.0, texturePos.left),
      max(0.0, texturePos.top),
      min(viewSize.width, texturePos.right),
      min(viewSize.height, texturePos.bottom));
  bool isPlaying = player.state == FijkState.started;
  return Positioned.fromRect(
    rect: rect,
    child: Container(
      alignment: Alignment.bottomLeft,
      child: IconButton(
        icon: Icon(
          isPlaying ? Icons.pause : Icons.play_arrow,
          color: Colors.white,
        ),
        onPressed: () {
          isPlaying ? player.pause() : player.start();
        },
      ),
    ),
  );
}

/// https://fijkplayer.befovy.com/docs/zh/custom-ui.html#%E6%9C%89%E7%8A%B6%E6%80%81-ui
class CustomFijkPanel extends StatefulWidget {
  final FijkPlayer player;
  final BuildContext buildContext;
  final Size viewSize;
  final Rect texturePos;

  const CustomFijkPanel({
    @required this.player,
    this.buildContext,
    this.viewSize,
    this.texturePos,
  });

  @override
  _CustomFijkPanelState createState() => _CustomFijkPanelState();
}

class _CustomFijkPanelState extends State<CustomFijkPanel> {
  FijkPlayer get player => widget.player;
  bool _playing = false;
  bool showPlayError = false;

  @override
  void initState() {
    super.initState();
    widget.player.addListener(_playerValueChanged);
  }

  void _playerValueChanged() {
    FijkValue value = player.value;

    if (value.state == FijkState.error) {
      setState(() {
        showPlayError = true;
      });
    } else {
      showPlayError = false;
    }

    // 暂停显示图标
    bool playing = (value.state == FijkState.paused);
    if (playing != _playing) {
      setState(() {
        _playing = playing;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Rect rect =
        Rect.fromLTWH(0, 0, widget.viewSize.width, widget.viewSize.height);
    return Positioned.fromRect(
      rect: rect,
      child: Stack(
        children: <Widget>[
          Positioned(
            child: GestureDetector(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.transparent,
                child: !_playing
                    ? Container()
                    : Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 60,
                      ),
              ),
              onTap: () {
                if (!showPlayError) {
                  !_playing ? widget.player.pause() : widget.player.start();
                }
              },
            ),
          ),
          Positioned(
            child: showPlayError
                ? Center(
                    child: Icon(
                      Icons.error,
                      color: Colors.white,
                      size: 40,
                    ),
                  )
                : SizedBox(),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    player.removeListener(_playerValueChanged);
  }
}
