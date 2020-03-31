import 'dart:core';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_project/config/device_config.dart';
import 'package:flutter_project/provide/login/login_provide.dart';
import 'package:provide/provide.dart';

class LoginBox extends StatelessWidget {
  final TextEditingController accountController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double margin = rpxWidth(context, 40);
    double w = rpxWidth(context, 750) - 2 * margin;

    return BackdropFilter(
      filter: ImageFilter.blur(
          sigmaX: rpxWidth(context, 8), sigmaY: rpxWidth(context, 8)),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                boxShadow: [
                  BoxShadow(
                      blurRadius: rpxWidth(context, 20), color: Colors.black12)
                ],
                borderRadius: BorderRadius.circular(rpxWidth(context, 20))),
            width: w,
            margin: EdgeInsets.symmetric(horizontal: margin),
            padding: EdgeInsets.all(rpxWidth(context, 30)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                LoginTitle(
                  title: "账号/手机号",
                ),
                LoginTextFiled(
                    controller: accountController,
                    width: w,
                    obscureText: false,
                    icon: Icon(
                      Icons.face,
                      size: rpxWidth(context, 40),
                    ),
                    hintText: "请输入账号/手机号"),
                LoginTitle(
                  title: "密码",
                ),
                LoginTextFiled(
                    controller: pwdController,
                    width: w,
                    obscureText: true,
                    icon: Icon(
                      Icons.lock,
                      size: rpxWidth(context, 40),
                    ),
                    hintText: "请输入密码"),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: rpxWidth(context, 60)),
            width: w,
            height: rpxWidth(context, 90),
            child: RaisedButton(
              onPressed: () {
                print("account ===> ${accountController.text}");
                print("pwd ===> ${pwdController.text}");
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(rpxWidth(context, 20))),
              color: Colors.blue,
              child: Text(
                '登录',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: rpxFontSize(context, 35),
                    fontFamily: 'zhushi-Medium'),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class LoginTitle extends StatelessWidget {
  LoginTitle({Key key, this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        title,
        style: TextStyle(
            fontFamily: 'zhushi-Medium', fontSize: rpxFontSize(context, 35)),
      ),
    );
  }
}

class LoginTextFiled extends StatelessWidget {
  LoginTextFiled(
      {Key key,
      @required this.controller,
      this.width,
      this.obscureText,
      this.icon,
      this.hintText})
      : super(key: key);
  final TextEditingController controller;
  final double width;
  final bool obscureText;
  final Icon icon;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: TextField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
              border: InputBorder.none, icon: icon, hintText: hintText),
          style: TextStyle(fontSize: rpxFontSize(context, 30))),
    );
  }
}
