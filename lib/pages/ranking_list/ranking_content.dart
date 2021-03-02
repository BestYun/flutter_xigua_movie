import 'package:flutter/material.dart';

class RankingContent extends StatefulWidget {
  final String content;
  RankingContent({this.content});
  @override
  _RankingContentState createState() => _RankingContentState();
}

class _RankingContentState extends State<RankingContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(widget.content),
      ),
    );
  }
}
