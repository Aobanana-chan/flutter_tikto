// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tiktok/controller/user_controller.dart';
import 'package:flutter_tiktok/controller/user_page_controller.dart';
import 'package:flutter_tiktok/page/widget/user_info_widget.dart';
import 'package:flutter_tiktok/page/widget/user_item_grid_widget.dart';
import 'package:flutter_tiktok/page/widget/user_more_bottom_sheet.dart';
import 'package:flutter_tiktok/page/widget/user_work_list_widget.dart';
import 'package:flutter_tiktok/res/colors.dart';
import 'package:get/get.dart';

class UserPage extends StatefulWidget {
  final PageController scrollPageController;
  final bool isLoginUser;
  final int uid;
  const UserPage(
      {Key key,
      this.scrollPageController,
      this.isLoginUser,
      // UserModel userModel,
      this.uid})
      : super(key: key);

  @override
  _UserPageState createState() {
    return _UserPageState();
  }
}

class _UserPageState extends State<UserPage> with TickerProviderStateMixin {
  final UserPageController _userPageController = Get.find();
  TabController _tabController;
  final PageController _pageController = PageController(keepPage: true);
  final ScrollController _scrollController = ScrollController();
  final UserController _userController = Get.put(UserController());
  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
    _scrollController.addListener(() {
      double position = _scrollController.offset;
      bool showTitle = _userPageController.showTitle.value;
      if (position > 145 && !showTitle) {
        _userPageController.setShowTitle(true);
      } else if (position < 145 && showTitle) {
        _userPageController.setShowTitle(false);
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((bottomBarLayout) {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ));
    });

    _userController
        .getUserWorkList(_userController.loginUserUid.value)
        .then((value) => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _pageController.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.color_1,
      body: CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          _getSliverAppBar(),
          _getSliverUserInfo(),
          _getTabBarLayout(),
          _getTabViewLayout(),
        ],
      ),
    );
  }

  _getSliverAppBar() {
    return SliverAppBar(
      backgroundColor: ColorRes.color_1,
      pinned: true,
      expandedHeight: 200,
      leading: widget.isLoginUser
          ? null
          : IconButton(
              onPressed: () {
                widget.scrollPageController.animateToPage(0,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.linear);
              },
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.white,
              ),
            ),
      actions: [
        IconButton(
          onPressed: () {
            if (widget.isLoginUser) {
              _userPageController.toggleRightMenu();
            } else {
              _showMore();
            }
          },
          icon: Icon(
            widget.isLoginUser ? Icons.menu : Icons.more_horiz_rounded,
            color: Colors.white,
          ),
        ),
      ],
      elevation: 0,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [StretchMode.zoomBackground],
        collapseMode: CollapseMode.parallax,
        title: Obx(() => Text(_userPageController.showTitle.value
            ? _userController.userInfoExResponse.value.user.nickname
            : '')),
        centerTitle: true,
        background: Image.asset(
          'assets/images/bg_1.jpg',
          fit: BoxFit.cover,
        ),
      ),
      // stretchTriggerOffset:145,
      onStretchTrigger: () {
        print('onStretchTrigger');
        return;
      },
      systemOverlayStyle: SystemUiOverlayStyle.light,
    );
  }

  _getSliverUserInfo() {
    return SliverToBoxAdapter(
      child: UserInfoWidget(
        isLoginUser: widget.isLoginUser,
        uid: widget.uid,
      ),
    );
  }

  _getTabBarLayout() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: StickyTabBarDelegate(
        child: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Container(
            color: ColorRes.color_1,
            child: TabBar(
              controller: _tabController,
              indicatorColor: ColorRes.color_4,
              labelStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              unselectedLabelStyle:
                  const TextStyle(fontSize: 15, color: Colors.grey),
              tabs: <Widget>[
                Tab(
                  child: Obx(
                    () => Text('作品 ${_userController.userWorkList.length}'),
                  ),
                ),
                const Tab(
                  child: Text(
                    '喜欢 6',
                  ),
                ),
              ],
              onTap: (index) {
                _pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.linear);
              },
            ),
          ),
        ),
      ),
    );
  }

  _getTabViewLayout() {
    //计算Item的高度
    double itemWidth = MediaQuery.of(context).size.width / 3;
    double itemHeight = itemWidth / 9 * 16;

    return SliverToBoxAdapter(
      child: Obx(
        () => ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            minWidth: MediaQuery.of(context).size.width,
            maxHeight: itemHeight * _userController.userWorkList.length / 3,
          ),
          child: PageView.builder(
            controller: _pageController,
            itemCount: 2,
            itemBuilder: (context, index) {
              return index == 0
                  ? const UserWorkListWidget()
                  : _getPageLayout(index);
            },
            onPageChanged: (index) {
              _tabController.animateTo(index);
            },
          ),
        ),
      ),
    );
  }

  //获取PageView的每页
  Widget _getPageLayout(int index) {
    return Container(
      color: ColorRes.color_1,
      child: GridView.builder(
        //处理GridView顶部空白
        padding: EdgeInsets.zero,
        itemCount: _userController.userWorkList.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //横轴元素个数
            crossAxisCount: 3,
            //纵轴间距
            mainAxisSpacing: 1,
            //横轴间距
            crossAxisSpacing: 1,
            //子组件宽高长度比例
            childAspectRatio: 9 / 16),
        itemBuilder: (BuildContext context, int index) {
          return UserItemGridWidget(
            gifUrl: _userController
                .userWorkList[index].content.attachments[0].cover,
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => VideoListPage(videoList: _userModel.worksVideo,)));
            },
          );
        },
      ),
    );
  }

  void _showMore() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: false, //可滚动 解除showModalBottomSheet最大显示屏幕一半的限制
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        builder: (context) {
          return const UserMoreBottomSheet();
        });
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final PreferredSize child;

  StickyTabBarDelegate({@required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => child.preferredSize.height;

  @override
  double get minExtent => child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
