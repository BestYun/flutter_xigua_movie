import 'package:flutter/material.dart';

class VideoDetailsPage extends StatefulWidget {
  @override
  _VideoDetailsPageState createState() => _VideoDetailsPageState();
}

class _VideoDetailsPageState extends State<VideoDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('视频详情'),
      ),
      body: Center(
        child: Text('视频详情'),
      ),
    );
  }
}
