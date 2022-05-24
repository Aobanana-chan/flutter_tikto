import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tiktok/controller/friend_page_controller.dart';
import 'package:get/get.dart';

///朋友
class FriendPage extends StatefulWidget {
  const FriendPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FriendPageState();
  }
}

class _FriendPageState extends State<FriendPage> {
  final FriendPageController _controller = Get.put(FriendPageController());
  final PageController _pageController = PageController(keepPage: true);
  @override
  void initState() {
    super.initState();
    //初始化右边用户信息
    // _mainController.setCurrentUserOfVideo(userModelList[0]);
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _controller.videoList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              // return VideoWidget(videoModel: _controller.videoList[index],showFocusButton: false,);
              return Container();
            },
            onPageChanged: (index) {
              // _mainController.setCurrentUserOfVideo(userModelList[index]);
            },
          ),
          Positioned(
            top: 0,
            child: _getTopLayout(),
          ),
        ],
      ),
    );
  }

  _getTopLayout() {
    return Container(
      margin: EdgeInsets.only(
          left: 16,
          right: 16,
          top: MediaQueryData.fromWindow(window).padding.top + 10),
      height: 36,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/add.png',
            width: 30,
            height: 30,
          ),
          const SizedBox(
            width: 15,
          ),
          Container(
            width: 280,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: Colors.white.withAlpha(50),
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/search.webp',
                  width: 22,
                  height: 22,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  '2个你可能认识的朋友',
                  style: TextStyle(fontSize: 13, color: Colors.white),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
