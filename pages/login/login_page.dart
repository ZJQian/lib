import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_project/config/device_config.dart';
import '../../provide/login/login_provide.dart';
import 'package:provide/provide.dart';

import 'login_box.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          BackgroundMain(),
          BackgroundReplace(),
          Positioned(
            left: 0,
            top: rpxWidth(context, 300),
            child: LoginBox(),
          )
        ],
      ),
    );
  }
}

class BackgroundMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<LoginProvide>(
      builder: (context, child, provide) {
        return Opacity(
          opacity: provide.opacityMain,
          child: Image.asset(
            'lib/images/login/bg_login_${provide.index}.png',
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}

class BackgroundReplace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<LoginProvide>(
      builder: (context, child, provide) {
        return Opacity(
          opacity: provide.opacityReplace,
          child: Image.asset(
            'lib/images/login/bg_login_${provide.indexReplace}.png',
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
