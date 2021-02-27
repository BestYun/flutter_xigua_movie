import 'package:flutter/material.dart';

///排行榜,包括热播榜
class RankingListPage extends StatefulWidget {
  @override
  _RankingListPageState createState() => _RankingListPageState();
}

class _RankingListPageState extends State<RankingListPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('排行榜'),
      ),
      body: Center(
        child: Text('排行榜'),
      ),
    );
  }
}
