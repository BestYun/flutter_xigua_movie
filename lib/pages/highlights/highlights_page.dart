import 'package:flutter/material.dart';
import 'package:flutter_xigua_movie/pages/highlights/short_video_play.dart';
import 'package:flutter_xigua_movie/utils/log_util.dart';

///精彩片段,短视频形式,截取电影最精彩的一段,吸引用户,点击看电影
class HighlightsPage extends StatefulWidget {
  @override
  _HighlightsPageState createState() => _HighlightsPageState();
}

class _HighlightsPageState extends State<HighlightsPage>
    with AutomaticKeepAliveClientMixin {
  final List<String> urls = [
    'http://1252463788.vod2.myqcloud.com/95576ef5vodtransgzp1252463788//e1ab85305285890781763144364/v.f10.mp4',
    'http://img.cloudnear.cn/big_buck_bunny.mp4',
    'https://alivc-demo-cms.alicdn.com/video/videoAD.mp4',
  ];
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    LogUtil.log('精彩片段build');
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (c, index) {
          return ShortVideoPlay(
            videoUrl: urls[index % 3],
          );
        },
        onPageChanged: (index) {
          //
        },
      ),
    );
  }
}
