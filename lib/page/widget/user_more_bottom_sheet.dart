import 'package:flutter/material.dart';
import 'package:flutter_tiktok/model/user_model.dart';
import 'package:flutter_tiktok/net/api.dart';
import 'package:get/get.dart';

class UserMoreBottomSheet extends StatefulWidget {
  const UserMoreBottomSheet({Key key}) : super(key: key);

  @override
  _UserMoreBottomSheetState createState() {
    return _UserMoreBottomSheetState();
  }
}

class _UserMoreBottomSheetState extends State<UserMoreBottomSheet> {
  @override
  Widget build(BuildContext context) {
    UserModel user = loginUserModel;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            user.name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            '抖音号:${user.douYinNumber}',
            style: const TextStyle(fontSize: 11, color: Colors.grey),
          ),
          const SizedBox(
            height: 20,
          ),
          Divider(
            color: Colors.grey.withAlpha(100),
            height: 0.05,
          ),
          Container(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: const Text(
                '分享',
                style: TextStyle(
                  fontSize: 14,
                ),
              )),
          Divider(
            color: Colors.grey.withAlpha(100),
            height: 0.05,
          ),
          Container(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: const Text(
                '发私信',
                style: TextStyle(
                  fontSize: 14,
                ),
              )),
          Divider(
            color: Colors.grey.withAlpha(100),
            height: 0.05,
          ),
          Container(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: const Text(
                '不让TA看',
                style: TextStyle(
                  fontSize: 14,
                ),
              )),
          Divider(
            color: Colors.grey.withAlpha(100),
            height: 0.05,
          ),
          Container(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: const Text(
                '举报',
                style: TextStyle(fontSize: 14, color: Colors.red),
              )),
          Divider(
            color: Colors.grey.withAlpha(100),
            height: 0.05,
          ),
          Container(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: const Text(
                '拉黑',
                style: TextStyle(fontSize: 14, color: Colors.red),
              )),
          Container(
            height: 8,
            color: Colors.grey.withAlpha(100),
          ),
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: const Text(
                  '取消',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
