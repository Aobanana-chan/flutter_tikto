// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_tiktok/common/router_manager.dart';
import 'package:flutter_tiktok/page/widget/shoot_bottom_bar_kind_widget.dart';
import 'package:flutter_tiktok/page/widget/shoot_bottom_bar_widget.dart';
import 'package:flutter_tiktok/res/colors.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

//拍摄页底部布局
class ShootBottomWidget extends StatefulWidget {
  const ShootBottomWidget({Key key}) : super(key: key);

  @override
  _ShootBottomWidgetState createState() {
    return _ShootBottomWidgetState();
  }
}

class _ShootBottomWidgetState extends State<ShootBottomWidget> {
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
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Column(
        children: [
          ShootBottomBarKindWidget(
            width: 200,
            height: 50,
            list: const ['照片', '视频', '游戏', '文字'],
            initialItem: 1,
            onSelected: (index) {},
          ),
          _getMiddleLayout(),
          const SizedBox(
            height: 20,
          ),
          ShootBottomBarWidget(
            width: MediaQuery.of(context).size.width,
            height: 60,
            list: const ['分段拍', '快拍', '影集'],
            initialItem: 1,
            onSelected: (index) {
              print('index:$index');
            },
          ),
        ],
      ),
    );
  }

  _getMiddleLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _getLeftLayout(),
        const SizedBox(
          width: 40,
        ),
        const FlashButton(
          size: 70,
        ),
        const SizedBox(
          width: 40,
        ),
        _getRightLayout(),
      ],
    );
  }

  _getLeftLayout() {
    return TextButton(
        onPressed: () {
          EasyLoading.showToast('功能待开发');
        },
        child: const Text('道具',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16)));
  }

  _getRightLayout() {
    return TextButton(
        onPressed: () async {
          var videoFile =
              await ImagePicker().pickVideo(source: ImageSource.gallery);
          Get.offNamed(Routers.feedPublish,
              parameters: {'videoPath': videoFile.path});
        },
        child: const Text('相册',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16)));
  }
}

class FlashButton extends StatelessWidget {
  final double size;
  final double borderWidth = 4;

  const FlashButton({Key key, this.size = 66}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double innerSize = size - borderWidth * 2 - 4;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
        border: Border.fromBorderSide(
            BorderSide(color: Colors.white, width: borderWidth)),
      ),
      alignment: Alignment.center,
      child: Container(
        width: innerSize,
        height: innerSize,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(innerSize / 2),
          color: ColorRes.color_3,
        ),
        child: Image.asset(
          'assets/images/flash.png',
          width: 5,
          height: 5,
        ),
      ),
    );
  }
}
