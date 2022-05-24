import 'package:flutter/material.dart';
import 'package:flutter_tiktok/controller/feed_controller.dart';
import 'package:flutter_tiktok/controller/main_page_scroll_controller.dart';
import 'package:flutter_tiktok/model/response/feed_list_response.dart';
import 'package:flutter_tiktok/page/widget/video_widget.dart';
import 'package:flutter_tiktok/res/colors.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

///首页tab推荐
class HomeTabRecommendPage extends StatefulWidget {
  final double contentHeight;
  final PageController pageController;
  const HomeTabRecommendPage({Key key, this.contentHeight, this.pageController})
      : super(key: key);

  @override
  _HomeTabRecommendPageState createState() {
    return _HomeTabRecommendPageState();
  }
}

class _HomeTabRecommendPageState extends State<HomeTabRecommendPage> {
  final MainPageScrollController _mainController = Get.find();
  final PageController _pageController = PageController(keepPage: true);
  final FeedController _feedController = Get.put(FeedController());
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  @override
  void initState() {
    super.initState();
    _feedController.refreshHotFeedList(_refreshController);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    _refreshController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: _refreshController,
      onRefresh: () {
        _feedController.refreshHotFeedList(_refreshController);
      },
      onLoading: () {
        _feedController.getHotFeedList(_refreshController);
      },
      child: _getVideoList(context),
    );
  }

  _getVideoList(BuildContext context) {
    return Obx(() {
      List<FeedListList> videoList = _feedController.hotFeedList;
      if (null == videoList || videoList.isEmpty) {
        return Container(
          color: ColorRes.color_1,
        );
      } else {
        return PageView.builder(
          controller: _pageController,
          itemCount: videoList.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return VideoWidget(
              video: videoList[index],
              showFocusButton: true,
              contentHeight: widget.contentHeight,
              onClickHeader: () {
                widget.pageController.nextPage(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.linear);
              },
            );
          },
          onPageChanged: (index) {
            _mainController.setCurrentUserOfVideo(videoList[index].user);
          },
        );
      }
    });
  }
}
