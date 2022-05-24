import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tiktok/controller/main_page_scroll_controller.dart';
import 'package:flutter_tiktok/controller/user_controller.dart';
import 'package:flutter_tiktok/page/friend_page.dart';
import 'package:flutter_tiktok/page/home_page.dart';
import 'package:flutter_tiktok/page/message_page.dart';
import 'package:flutter_tiktok/page/user_page.dart';
import 'package:flutter_tiktok/page/widget/main_page_bottom_bar_widget.dart';
import 'package:flutter_tiktok/res/colors.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  final MainPageScrollController mainPageController = Get.find();
  final PageController scrollPageController;
  final UserController _userController = Get.put(UserController());
  MainPage({Key key, this.scrollPageController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _userController.getLoginUserUid();
    WidgetsBinding.instance.addPostFrameCallback((bottomBarLayout) {
      //设置状态栏的颜色和图标模式
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: ColorRes.color_1,
        statusBarIconBrightness: Brightness.dark,
      ));
    });
    return Scaffold(
      body: Obx(() => _getBody()),
      //底部导航
      bottomNavigationBar: const MainPageBottomBarWidget(),
    );
  }

  _getBody() {
    switch (mainPageController.indexBottomBarMainPage.value) {
      case 0:
        return HomePage(scrollPageController: scrollPageController);
      case 1:
        return const FriendPage();
      case 2:
        return const MessagePage();
      case 3:
        return Obx(() {
          int uid = _userController.loginUserUid.value;
          if (uid == 0) {
            return UserPage(
              scrollPageController: scrollPageController,
              isLoginUser: false,
              // userModel: loginUserModel,
            );
          } else {
            return UserPage(
              scrollPageController: scrollPageController,
              isLoginUser: true,
              // userModel: loginUserModel,
              uid: uid,
            );
          }
        });
    }
  }
}
