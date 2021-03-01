import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_xigua_movie/colors/theme_colors.dart';
import 'package:flutter_xigua_movie/model/category_item_model.dart';
import 'package:flutter_xigua_movie/pages/movie_libraries/category_selected_controller.dart';
import 'package:flutter_xigua_movie/pages/movie_libraries/category_widget.dart';
import 'package:get/get.dart';

///片库,包括搜索
class MovieLibrariesPage extends StatefulWidget {
  @override
  _MovieLibrariesPageState createState() => _MovieLibrariesPageState();
}

class _MovieLibrariesPageState extends State<MovieLibrariesPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final categoryData = [
    [
      CategoryItemModel(
        id: 0,
        categoryName: '综合排序',
      ),
      CategoryItemModel(
        id: 1,
        categoryName: '最新上线',
      ),
      CategoryItemModel(
        id: 2,
        categoryName: '热播流行',
      ),
      CategoryItemModel(
        id: 3,
        categoryName: '西瓜评分',
      ),
    ],
    [
      CategoryItemModel(
        id: 0,
        categoryName: '全部类型',
      ),
      CategoryItemModel(
        id: 1,
        categoryName: '动作',
      ),
      CategoryItemModel(
        id: 2,
        categoryName: '战争',
      ),
      CategoryItemModel(
        id: 3,
        categoryName: '科幻',
      ),
      CategoryItemModel(
        id: 4,
        categoryName: '冒险',
      ),
    ],
    [
      CategoryItemModel(
        id: 0,
        categoryName: '全部地区',
      ),
      CategoryItemModel(
        id: 1,
        categoryName: '中国',
      ),
      CategoryItemModel(
        id: 2,
        categoryName: '中国香港',
      ),
      CategoryItemModel(
        id: 3,
        categoryName: '美国',
      ),
      CategoryItemModel(
        id: 4,
        categoryName: '英国',
      ),
      CategoryItemModel(
        id: 5,
        categoryName: '其它',
      ),
    ],
    [
      CategoryItemModel(
        id: 0,
        categoryName: '全部年份',
      ),
      CategoryItemModel(
        id: 1,
        categoryName: '2021',
      ),
      CategoryItemModel(
        id: 2,
        categoryName: '2020',
      ),
      CategoryItemModel(
        id: 3,
        categoryName: '2019',
      ),
      CategoryItemModel(
        id: 4,
        categoryName: '2018',
      ),
      CategoryItemModel(
        id: 5,
        categoryName: '2017',
      ),
    ],
  ];

  @override
  void initState() {
    Get.put(CategotySelectedController());
    initCategory();
    super.initState();
  }

  initCategory() {
    CategotySelectedController c = Get.find<CategotySelectedController>();
    Map<String, CategoryItemModel> map = Map<String, CategoryItemModel>();
    for (int i = 0; i < categoryData.length; i++) {
      map[i.toString()] = categoryData[i].first;
    }
    c.setupData(map);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('片库'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: Container(
            child: CategoryWidget(
              data: categoryData,
            ),
            margin: EdgeInsets.all(30.w),
          )),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (c, index) {
                  return _Item();
                },
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.7,
                crossAxisCount: 3,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              color: ThemeColors.imageBgColor,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    top: 0,
                    child: CachedNetworkImage(
                      imageUrl: 'http://img.cloudnear.cn/1.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 6,
                    right: 6,
                    child: Text(
                      '9.6',
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 4),
          Text(
            '电影名称' * 20,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white, fontSize: 24.sp),
          ),
        ],
      ),
    );
  }
}
