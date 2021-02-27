import 'package:flutter/material.dart';

class HomeOtherBody extends StatefulWidget {
  final String item;
  HomeOtherBody({@required this.item});
  @override
  _HomeOtherBodyState createState() => _HomeOtherBodyState();
}

class _HomeOtherBodyState extends State<HomeOtherBody>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(widget.item),
      ),
    );
  }
}
