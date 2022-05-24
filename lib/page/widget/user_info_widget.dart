import 'package:flutter/material.dart';
import 'package:flutter_tiktok/common/router_manager.dart';
import 'package:flutter_tiktok/controller/user_controller.dart';
import 'package:flutter_tiktok/model/response/user_info_ex_response.dart';
import 'package:flutter_tiktok/res/colors.dart';
import 'package:get/get.dart';

///用户信息
class UserInfoWidget extends StatefulWidget {
  final bool isLoginUser;
  final int uid;
  const UserInfoWidget({Key key, this.isLoginUser, this.uid}) : super(key: key);

  @override
  _UserInfoWidgetState createState() {
    return _UserInfoWidgetState();
  }
}

class _UserInfoWidgetState extends State<UserInfoWidget> {
  final UserController _userController = Get.put(UserController());
  final double _widgetHeight = 320;
  bool focus = false;
  bool isLoginUser = true;
  @override
  void initState() {
    super.initState();
    _userController.getUserInfoEx(widget.uid.toString());
  }

  //获取控件高度
  double getWidgetHeight() {
    return _widgetHeight;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //背景颜色
        _getBackgroundColor(),
        Column(
          children: [
            //头像、关注
            _getHeaderLayout(),
            //用户信息
            _getUserInfoLayout(),
          ],
        ),
      ],
    );
  }

  //背景颜色
  _getBackgroundColor() {
    return Positioned(
        top: 0,
        child: Container(
          color: ColorRes.color_1,
          width: MediaQuery.of(context).size.width,
          height: _widgetHeight,
        ));
  }

  //头像等
  _getHeaderLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(() {
          UserInfoExUser userEx = _userController.userInfoExResponse.value.user;
          return Container(
            width: 80,
            height: 80,
            margin: const EdgeInsets.only(left: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: const Border.fromBorderSide(
                    BorderSide(color: ColorRes.color_1, width: 2)),
                image: DecorationImage(
                    image: userEx == null
                        ? const AssetImage('assets/images/person_holder.png')
                        : NetworkImage(userEx.portrait),
                    fit: BoxFit.cover)),
          );
        }),
        Expanded(
          child: _userController.isLoginUser.value
              ? _getLoginUser()
              : _getCommonUser(),
        ),
      ],
    );
  }

  //登录用户返回
  _getLoginUser() {
    return InkWell(
      onTap: () {
        Get.toNamed(Routers.editUserInfo);
      },
      child: Container(
        height: 37,
        margin: const EdgeInsets.only(left: 10, right: 16),
        decoration: BoxDecoration(
          color: ColorRes.color_2.withAlpha(20),
          borderRadius: BorderRadius.circular(2),
        ),
        alignment: Alignment.center,
        child: const Text(
          '编辑资料',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }

  //一般用户返回
  _getCommonUser() {
    return InkWell(
      onTap: () {
        setState(() {
          focus = !focus;
        });
      },
      child: Container(
        height: 37,
        margin: const EdgeInsets.only(left: 10, right: 16),
        decoration: BoxDecoration(
          color: focus ? ColorRes.color_2.withAlpha(20) : ColorRes.color_3,
          borderRadius: BorderRadius.circular(2),
        ),
        alignment: Alignment.center,
        child: Text(
          focus ? '取消关注' : '+  关注',
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }

  _getUserInfoLayout() {
    return Container(
      margin: const EdgeInsets.only(left: 12, right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Obx(
            () => Text(
              _userController.userInfoExResponse.value.user == null
                  ? ''
                  : _userController.userInfoExResponse.value.user.nickname,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            '抖音号：${widget.uid}',
            style: const TextStyle(color: ColorRes.color_2, fontSize: 12),
          ),
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: Colors.grey.withAlpha(100),
            height: 0.05,
          ),
          const SizedBox(
            height: 10,
          ),
          Obx(
            () => Text(
              _userController.userInfoExResponse.value.user == null
                  ? ''
                  : _userController.userInfoExResponse.value.user.bio,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          _getSexCity(),
          const SizedBox(
            height: 10,
          ),
          _getNumberLayout(),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  _getSexCity() {
    return Row(
      children: [
        //性别
        Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: ColorRes.color_2.withAlpha(50),
            borderRadius: BorderRadius.circular(2),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _getImgGender(context),
              const SizedBox(
                width: 2,
              ),
              _getAge(context)
            ],
          ),
        ),
        //城市
        Container(
          padding: const EdgeInsets.all(3),
          margin: const EdgeInsets.only(left: 5),
          decoration: BoxDecoration(
            color: ColorRes.color_2.withAlpha(50),
            borderRadius: BorderRadius.circular(2),
          ),
          child: Text(
            _userController.userInfoExResponse.value.user == null
                ? ''
                : _userController.userInfoExResponse.value.user.city,
            style: const TextStyle(color: Colors.grey, fontSize: 10),
          ),
        ),
      ],
    );
  }

  //获赞数、关注数、粉丝
  _getNumberLayout() {
    return Row(
      children: [
        Obx(
          () => Text(
            _userController.userInfoExResponse.value.user == null
                ? ''
                : _userController.userInfoExResponse.value.likeCount.toString(),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        const SizedBox(
          width: 2,
        ),
        const Text(
          '获赞',
          style: TextStyle(color: ColorRes.color_2, fontSize: 13),
        ),
        const SizedBox(
          width: 15,
        ),
        Obx(
          () => Text(
            _userController.userInfoExResponse.value.user == null
                ? ''
                : _userController.userInfoExResponse.value.followingCount
                    .toString(),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        const SizedBox(
          width: 2,
        ),
        const Text(
          '关注',
          style: TextStyle(color: ColorRes.color_2, fontSize: 13),
        ),
        const SizedBox(
          width: 15,
        ),
        Obx(
          () => Text(
            _userController.userInfoExResponse.value.user == null
                ? ''
                : _userController.userInfoExResponse.value.followerCount
                    .toString(),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        const SizedBox(
          width: 2,
        ),
        const Text(
          '粉丝',
          style: TextStyle(color: ColorRes.color_2, fontSize: 13),
        ),
      ],
    );
  }

  //获取性别图标
  _getImgGender(BuildContext context) {
    return Obx(() {
      if (_userController.userInfoExResponse == null) {
        return Image.asset(
          'assets/images/male.webp',
          width: 10,
          height: 10,
        );
      } else {
        int gender = 2;
        UserInfoExUser userEx = _userController.userInfoExResponse.value.user;
        if (userEx != null) gender = userEx.gender;
        return Image.asset(
          gender == 2 ? 'assets/images/male.webp' : 'assets/images/famale.webp',
          width: 10,
          height: 10,
        );
      }
    });
  }

  //获取年龄
  _getAge(BuildContext context) {
    return Obx(() {
      if (_userController.userInfoExResponse.value.user == null) {
        return Container();
      } else {
        String birth = _userController.userInfoExResponse.value.user.birth;
        List<String> tempArr = birth.split('-');
        int age = DateTime.now().year - int.parse(tempArr[0]);
        return Text(
          '$age岁',
          style: const TextStyle(color: Colors.grey, fontSize: 10),
        );
      }
    });
  }
}
