import 'package:flutter/material.dart';

///片库,包括搜索
class MovieLibrariesPage extends StatefulWidget {
  @override
  _MovieLibrariesPageState createState() => _MovieLibrariesPageState();
}

class _MovieLibrariesPageState extends State<MovieLibrariesPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('片库'),
      ),
      body: Center(
        child: Text('片库'),
      ),
    );
  }
}
