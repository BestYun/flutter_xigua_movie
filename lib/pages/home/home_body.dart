import 'package:flutter/material.dart';

class HomeBody extends StatefulWidget {
  final ScrollController scrollController;
  HomeBody({this.scrollController});

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomScrollView(
      controller: widget.scrollController,
      slivers: List.generate(
        30,
        (index) => SliverToBoxAdapter(
          child: Container(
            height: 200,
            color: index % 2 == 0 ? Colors.red : Colors.orange,
            child: Center(
              child: Text('$index'),
            ),
          ),
        ),
      ),
    );
  }
}
