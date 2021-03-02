import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_xigua_movie/colors/theme_colors.dart';
import 'package:flutter_xigua_movie/model/category_item_model.dart';
import 'package:flutter_xigua_movie/pages/movie_libraries/controller/category_selected_controller.dart';
import 'package:flutter_xigua_movie/pages/movie_libraries/controller/category_show_top_title_controller.dart';
import 'package:flutter_xigua_movie/pages/movie_libraries/category_top_selected_title.dart';
import 'package:flutter_xigua_movie/pages/movie_libraries/category_widget.dart';
import 'package:flutter_xigua_movie/pages/movie_libraries/controller/show_top_category_controller.dart';
import 'package:flutter_xigua_movie/utils/log_util.dart';
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
  ScrollController scrollController = ScrollController();
  //定义一个key
  GlobalKey key = GlobalKey();
  final List<List<CategoryItemModel>> categoryData = [
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
    Get.put(CategoryShowTopTitleController());
    Get.put(ShowTopCategoryController());

    initCategory();

    scrollController.addListener(() {
      RenderBox renderBox = key.currentContext.findRenderObject();
      //如果顶部再次显示分类,一滚动就隐藏
      var topCategorController = Get.find<ShowTopCategoryController>();
      if (topCategorController.isShow) {
        topCategorController.updateShowState(false);
      }

      if (scrollController.offset >= renderBox.size.height) {
        //
        var c = Get.find<CategoryShowTopTitleController>();
        if (!c.isShow) {
          c.updateShowState(true);
        }
      }
      if (scrollController.offset < renderBox.size.height - 36) {
        var c = Get.find<CategoryShowTopTitleController>();
        if (c.isShow) {
          c.updateShowState(false);
        }
      }
    });
    super.initState();
  }

  initCategory() {
    ///默认初始化各个分类第一个选项
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
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 0,
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    key: key,
                    child: CategoryWidget(
                      data: categoryData,
                    ),
                    margin: EdgeInsets.only(
                        left: 30.w, top: 30.w, right: 30.w, bottom: 20.w),
                  ),
                ),
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
          ),
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            child: GetBuilder<CategoryShowTopTitleController>(
              builder: (c) {
                return c.isShow ? CategoryTopSelectedTitle() : SizedBox();
              },
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            child: GetBuilder<ShowTopCategoryController>(
              builder: (c) {
                return c.isShow
                    ? Container(
                        color: ThemeColors.bgColor,
                        child: CategoryWidget(
                          data: categoryData,
                        ),
                        padding: EdgeInsets.only(
                            left: 30.w, top: 30.w, right: 30.w, bottom: 20.w),
                      )
                    : SizedBox();
              },
            ),
          ),
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
