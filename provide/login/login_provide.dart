import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

import 'package:flutter_project/config/color_config.dart';

class LoginProvide extends State<StatefulWidget>
    with ChangeNotifier, TickerProviderStateMixin {
  //实例animation对象  和必要的控制和状态对象
  Animation<double> animation;
  AnimationController controller;

  double opacityMain = 1.0;
  double opacityReplace = 0.0;
  int index = 0;
  int indexReplace = 1;
  List<String> imgList = [
    "lib/images/login/bg_login_0",
    "lib/images/login/bg_login_1",
    "lib/images/login/bg_login_2",
    "lib/images/login/bg_login_3",
    "lib/images/login/bg_login_4"
  ];
  Timer interval;

  // Color btnColor;
  // bool btnEnable;

  LoginProvide() {
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        opacityMain = 1.0 - animation.value;
        opacityReplace = animation.value;
        notifyListeners();
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          index++;
          indexReplace++;
          if (index == imgList.length) {
            index = 0;
          }
          if (indexReplace == imgList.length) {
            indexReplace = 0;
          }
          opacityMain = 1.0;
          opacityReplace = 0.0;
        }
      });
    interval = Timer.periodic(Duration(seconds: 5), (callback) {
      controller.forward(from: 0);
    });
  }

  @override
  void dispose() {
    interval.cancel();
    controller.dispose();
    super.dispose();
  }

  // judgeBtnStatus(TextEditingController accountController,
  //     TextEditingController pwdController) {
  //   if (accountController.text.length >= 6 && pwdController.text.length >= 6) {
  //     btnColor = ColorManager.colorAppTheme(context);
  //     btnEnable = true;
  //   } else {
  //     btnColor = Colors.grey;
  //     btnEnable = false;
  //   }
  //   notifyListeners();
  // }

  @override
  Widget build(BuildContext context) {
    return null;
  }
}
