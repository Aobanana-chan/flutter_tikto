import 'package:flutter_tiktok/page/feed_publish_page.dart';
import 'package:flutter_tiktok/page/home_page.dart';
import 'package:flutter_tiktok/page/home_tab_city_page.dart';
import 'package:flutter_tiktok/page/home_tab_focus_page.dart';
import 'package:flutter_tiktok/page/home_tab_recommend_page.dart';
import 'package:flutter_tiktok/page/living_page.dart';
import 'package:flutter_tiktok/page/login_page.dart';
import 'package:flutter_tiktok/page/main_page.dart';
import 'package:flutter_tiktok/page/message_page.dart';
import 'package:flutter_tiktok/page/modify_info_page.dart';
import 'package:flutter_tiktok/page/register_page.dart';
import 'package:flutter_tiktok/page/scan_page.dart';
import 'package:flutter_tiktok/page/scroll_page.dart';
import 'package:flutter_tiktok/page/search_page.dart';
import 'package:flutter_tiktok/page/setting_page.dart';
import 'package:flutter_tiktok/page/shoot_page.dart';
import 'package:flutter_tiktok/page/test.dart';
import 'package:flutter_tiktok/page/user_info_edit_page.dart';
import 'package:flutter_tiktok/page/user_page.dart';
import 'package:flutter_tiktok/page/video_list_page.dart';
import 'package:flutter_tiktok/page/my_tiktok_code_page.dart';
import 'package:get/get.dart';

///路由管理者
class RouterManager {
  static final routes = [
    GetPage(name: Routers.test, page: () => const TestPage()),
    GetPage(name: Routers.scroll, page: () => const ScrollPage()),
    GetPage(name: Routers.main, page: () => MainPage()),
    GetPage(name: Routers.user, page: () => const UserPage()),
    GetPage(name: Routers.shoot, page: () => const ShootPage()),
    GetPage(name: Routers.home, page: () => const HomePage()),
    GetPage(name: Routers.message, page: () => const MessagePage()),
    GetPage(name: Routers.homeTabCity, page: () => const HomeTabCityPage()),
    GetPage(name: Routers.homeTabFocus, page: () => const HomeTabFocusPage()),
    GetPage(
        name: Routers.homeTabRecommend,
        page: () => const HomeTabRecommendPage()),
    GetPage(name: Routers.videoList, page: () => const VideoListPage()),
    GetPage(name: Routers.search, page: () => const SearchPage()),
    GetPage(name: Routers.scan, page: () => const ScanPage()),
    GetPage(name: Routers.tikTokCode, page: () => const MyTikTokCodePage()),
    GetPage(name: Routers.living, page: () => const LivingPage()),
    GetPage(
      name: Routers.login,
      page: () => const LoginPage(),
      transition: Transition.downToUp,
    ),
    GetPage(name: Routers.register, page: () => const RegisterPage()),
    GetPage(name: Routers.setting, page: () => const SettingPage()),
    GetPage(name: Routers.editUserInfo, page: () => const UserInfoEditPage()),
    GetPage(name: Routers.modifyUserInfo, page: () => const ModifyInfoPage()),
    GetPage(name: Routers.feedPublish, page: () => const FeedPublishPage()),
  ];
}

///路由名称
class Routers {
  static const String test = '/test';
  static const String scroll = '/scroll';
  static const String main = '/main';
  static const String user = '/user';
  static const String shoot = '/shoot';
  static const String home = '/home';
  static const String friend = '/friend';
  static const String message = '/message';
  static const String homeTabCity = '/homeTabCity';
  static const String homeTabFocus = '/homeTabFocus';
  static const String homeTabRecommend = '/homeTabRecommend';
  static const String videoList = '/videoList';
  static const String search = '/search';
  static const String scan = '/scan';
  static const String tikTokCode = '/tikTokCode';
  static const String living = '/living';
  static const String login = '/login';
  static const String register = '/register';
  static const String setting = '/setting';
  static const String editUserInfo = '/editUserInfo';
  static const String modifyUserInfo = '/modifyUserInfo';
  static const String feedPublish = '/feedPublish';
}
