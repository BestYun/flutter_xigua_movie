import 'package:flutter/material.dart';

///精彩片段,短视频形式,截取电影最精彩的一段,吸引用户,点击看电影
class HighlightsPage extends StatefulWidget {
  @override
  _HighlightsPageState createState() => _HighlightsPageState();
}

class _HighlightsPageState extends State<HighlightsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('精彩片段'),
      ),
      body: Center(
        child: Text('精彩片段'),
      ),
    );
  }
}
