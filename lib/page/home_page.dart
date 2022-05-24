import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tiktok/common/application.dart';
import 'package:flutter_tiktok/common/router_manager.dart';
import 'package:flutter_tiktok/event/stop_play_event.dart';
import 'package:flutter_tiktok/page/home_tab_focus_page.dart';
import 'package:flutter_tiktok/page/home_tab_recommend_page.dart';
import 'package:flutter_tiktok/res/colors.dart';
import 'package:get/get.dart';

///首页
class HomePage extends StatefulWidget {
  final PageController scrollPageController;
  const HomePage({Key key, this.scrollPageController}) : super(key: key);

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;
  double _screenHeight;
  double _screenWidth;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this, initialIndex: 1);
    _pageController = PageController(initialPage: 1, keepPage: true);
    WidgetsBinding.instance.addPostFrameCallback((bottomBarLayout) {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
      ));
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _screenHeight = MediaQuery.of(context).size.height;
    _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: _getBody(),
    );
  }

  _getBody() {
    return SizedBox(
      width: _screenWidth,
      height: _screenHeight,
      child: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQueryData.fromWindow(window).padding.top,
          ),
          Positioned(
              top: MediaQueryData.fromWindow(window).padding.top,
              child: _getContent()),
          Positioned(
              top: MediaQueryData.fromWindow(window).padding.top,
              child: _getTopLayout()),
        ],
      ),
    );
  }

  _getTopLayout() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 44,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: InkWell(
                onTap: () {
                  Get.toNamed(Routers.living);
                },
                child: Image.asset('assets/images/live_btn.webp',
                    width: 35, height: 35)),
          ),
          _getTabBar(),
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: InkWell(
                onTap: () {
                  Application.eventBus.fire(StopPlayEvent());
                  Get.toNamed(Routers.search);
                },
                child: Image.asset('assets/images/search.webp',
                    width: 35, height: 35, color: ColorRes.color_2)),
          ),
        ],
      ),
    );
  }

  //头部：城市、关注、推荐
  _getTabBar() {
    return Container(
      width: 200,
      height: 44,
      alignment: Alignment.center,
      child: TabBar(
        tabs: const [
          // Text('杭州'),
          Text('关注'),
          Text('推荐'),
        ],
        indicatorColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.label,
        labelPadding: const EdgeInsets.only(bottom: 2),
        labelColor: Colors.white,
        unselectedLabelColor: ColorRes.color_2,
        labelStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        controller: _tabController,
        onTap: (index) {
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 200),
              curve: Curves.linear);
        },
      ),
    );
  }

  _getContent() {
    double contentHeight = MediaQuery.of(context).size.height -
        48 -
        MediaQueryData.fromWindow(window).padding.top;
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: contentHeight,
      ),
      child: NotificationListener(
        child: PageView(
            controller: _pageController,
            children: [
              // HomeTabCityPage(),
              HomeTabFocusPage(
                contentHeight: contentHeight,
                pageController: widget.scrollPageController,
              ),
              HomeTabRecommendPage(
                contentHeight: contentHeight,
                pageController: widget.scrollPageController,
              )
            ],
            onPageChanged: (index) {
              _tabController.animateTo(index);
            }),
        onNotification: (overscroll) {
          if (overscroll is OverscrollNotification &&
              overscroll.overscroll != 0 &&
              overscroll.dragDetails != null) {
            if (overscroll.overscroll > 0) {
              widget.scrollPageController.nextPage(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.linear);
            } else {}
          }
          return true;
        },
      ),
    );
  }
}
