import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_tiktok/controller/user_controller.dart';
import 'package:flutter_tiktok/res/colors.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() {
    return _RegisterPageState();
  }
}

class _RegisterPageState extends State<RegisterPage> {
  TextField accountField, pwdField, pwdRepeatField;
  String account, pwd, pwdRepeat;
  UserController loginController = Get.find();
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
    accountField = TextField(
      cursorColor: ColorRes.color_1,
      cursorWidth: 2,
      decoration:
          const InputDecoration(border: InputBorder.none, hintText: '请输入账号'),
      onChanged: (text) {
        account = text;
      },
    );

    pwdField = TextField(
      cursorColor: ColorRes.color_1,
      cursorWidth: 2,
      obscureText: true,
      decoration:
          const InputDecoration(border: InputBorder.none, hintText: '请输入密码'),
      onChanged: (text) {
        pwd = text;
      },
    );

    pwdRepeatField = TextField(
      cursorColor: ColorRes.color_1,
      cursorWidth: 2,
      obscureText: true,
      decoration:
          const InputDecoration(border: InputBorder.none, hintText: '请再次输入密码'),
      onChanged: (text) {
        pwdRepeat = text;
      },
    );

    return Scaffold(
      backgroundColor: ColorRes.color_1,
      appBar: AppBar(
        backgroundColor: ColorRes.color_1,
        elevation: 0,
        leading: TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Icon(
            Icons.close,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
      body: _layoutLogin(context),
    );
  }

  _layoutLogin(BuildContext context) {
    return Container(
      height: 400,
      margin: const EdgeInsets.only(top: 150),
      child: Column(
        children: [
          _getAccountTextField(),
          const SizedBox(
            height: 10,
          ),
          _getPwdTextField(),
          const SizedBox(
            height: 10,
          ),
          _getPwdRepeatTextField(),
          const SizedBox(
            height: 20,
          ),
          _getRegister(context),
        ],
      ),
    );
  }

  _getAccountTextField() {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(left: 60, right: 60),
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: accountField,
    );
  }

  _getPwdTextField() {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(left: 60, right: 60),
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: pwdField,
    );
  }

  _getPwdRepeatTextField() {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(left: 60, right: 60),
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: pwdRepeatField,
    );
  }

  _getRegister(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 60, right: 60),
      height: 50,
      width: MediaQuery.of(context).size.width,
      // ignore: deprecated_member_use
      child: RaisedButton(
        onPressed: () {
          if (null != account &&
              account.isNotEmpty &&
              null != pwd &&
              pwd.isNotEmpty &&
              null != pwdRepeat &&
              pwdRepeat.isNotEmpty) {
            if (pwd == pwdRepeat) {
              loginController.register(account, pwd, pwdRepeat);
            } else {
              EasyLoading.showToast('两次输入的密码不一致');
            }
          } else {
            EasyLoading.showToast('请填写完整');
          }
        },
        color: ColorRes.color_3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: const Text(
          '注册',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
