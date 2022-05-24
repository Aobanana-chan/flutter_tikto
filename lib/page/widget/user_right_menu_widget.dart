import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_tiktok/common/application.dart';
import 'package:flutter_tiktok/common/router_manager.dart';
import 'package:flutter_tiktok/event/close_main_drawer_event.dart';
import 'package:flutter_tiktok/res/colors.dart';
import 'package:get/get.dart';

class UserRightMenuWidget extends StatefulWidget {
  const UserRightMenuWidget({Key key}) : super(key: key);

  @override
  _UserRightMenuWidgetState createState() {
    return _UserRightMenuWidgetState();
  }
}

class _UserRightMenuWidgetState extends State<UserRightMenuWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width / 3 * 2,
        height: MediaQuery.of(context).size.height,
        color: ColorRes.color_1,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: _getMenuItem(),
              ),
            ),
            Positioned(
              bottom: 40,
              child: Container(
                width: MediaQuery.of(context).size.width / 3 * 2 - 40,
                height: 37,
                padding: const EdgeInsets.only(left: 36, right: 36),
                decoration: BoxDecoration(
                  color: ColorRes.color_2.withAlpha(40),
                  borderRadius: BorderRadius.circular(2),
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/more_block.png',
                      width: 20,
                      height: 20,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      '更多功能',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getMenuItem() {
    return [
      Container(
        height: 50,
      ),
      UserRightMenuItemWidget(
        iconUrl: 'assets/images/shop.png',
        title: '我的订单',
        onTap: () {
          EasyLoading.showToast('功能待开发');
        },
      ),
      UserRightMenuItemWidget(
        iconUrl: 'assets/images/wallet.png',
        title: '钱包',
        onTap: () {
          EasyLoading.showToast('功能待开发');
        },
      ),
      const SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Divider(
          color: Colors.grey.withAlpha(100),
          height: 0.05,
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      UserRightMenuItemWidget(
        iconUrl: 'assets/images/hollow_star.png',
        title: '我的收藏',
        onTap: () {
          EasyLoading.showToast('功能待开发');
        },
      ),
      UserRightMenuItemWidget(
        iconUrl: 'assets/images/sun.png',
        title: '我的动态',
        onTap: () {
          EasyLoading.showToast('功能待开发');
        },
      ),
      UserRightMenuItemWidget(
        iconUrl: 'assets/images/framer.png',
        title: '创作者服务中心',
        onTap: () {
          EasyLoading.showToast('功能待开发');
        },
      ),
      const SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Divider(
          color: Colors.grey.withAlpha(100),
          height: 0.05,
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      UserRightMenuItemWidget(
        iconUrl: 'assets/images/line_application.webp',
        title: '小程序',
        onTap: () {
          EasyLoading.showToast('功能待开发');
        },
      ),
      UserRightMenuItemWidget(
        iconUrl: 'assets/images/gongyi.webp',
        title: '抖音公益',
        onTap: () {
          EasyLoading.showToast('功能待开发');
        },
      ),
      UserRightMenuItemWidget(
        iconUrl: 'assets/images/rib.png',
        title: '未成年保护工具',
        onTap: () {
          EasyLoading.showToast('功能待开发');
        },
      ),
      UserRightMenuItemWidget(
        iconUrl: 'assets/images/service.png',
        title: '我的客服',
        onTap: () {
          EasyLoading.showToast('功能待开发');
        },
      ),
      UserRightMenuItemWidget(
        iconUrl: 'assets/images/setting.png',
        title: '设置',
        onTap: () {
          Application.eventBus.fire(CloseMainDrawerEvent());
          Get.toNamed(Routers.setting);
        },
      ),
      Container(
        height: 100,
      ),
    ];
  }
}

class UserRightMenuItemWidget extends StatelessWidget {
  final String iconUrl;
  final String title;
  final Function onTap;
  final Alignment alignment;

  const UserRightMenuItemWidget(
      {Key key, this.iconUrl, this.title, this.onTap, this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorRes.color_1,
      child: InkWell(
        onTap: () {
          onTap?.call();
        },
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          height: 60,
          alignment: alignment ?? Alignment.centerLeft,
          color: ColorRes.color_1,
          child: Row(
            children: [
              Image.asset(
                iconUrl,
                width: 18,
                height: 18,
                color: Colors.white,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 14),
              )
            ],
          ),
        ),
      ),
    );
  }
}
