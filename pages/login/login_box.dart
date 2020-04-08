import 'dart:core';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/config/color_config.dart';
import 'package:flutter_project/config/device_config.dart';
import 'package:flutter_project/config/tool.dart';
import 'package:flutter_project/pages/login/register_box.dart';
import 'package:flutter_project/provide/login/login_provide.dart';
import 'package:provide/provide.dart';

import '../index_page.dart';

class LoginBox extends StatefulWidget {
  @override
  _LoginBoxState createState() => _LoginBoxState();
}

class _LoginBoxState extends State<LoginBox> with TickerProviderStateMixin {
  final TextEditingController accountController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();
  Color btnColor = Colors.grey;
  bool btnEnable = false;

  int index = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double margin = rpxWidth(context, 40);
    double w = rpxWidth(context, 750) - 2 * margin;

    return BackdropFilter(
      filter: ImageFilter.blur(
          sigmaX: rpxWidth(context, 8), sigmaY: rpxWidth(context, 8)),
      child: IndexedStack(
        index: index,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: rpxWidth(context, 20),
                          color: Colors.black12)
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
                      maxLength: 11,
                      icon: Icon(
                        Icons.face,
                        size: rpxWidth(context, 40),
                      ),
                      hintText: "请输入账号/手机号",
                      onValueChanged: () {
                        this.judgeBtnStatus(context, accountController.text,
                            pwdController.text);
                      },
                    ),
                    LoginTitle(
                      title: "密码",
                    ),
                    LoginTextFiled(
                      controller: pwdController,
                      width: w,
                      obscureText: true,
                      maxLength: 15,
                      icon: Icon(
                        Icons.lock,
                        size: rpxWidth(context, 40),
                      ),
                      hintText: "请输入密码",
                      onValueChanged: () {
                        this.judgeBtnStatus(context, accountController.text,
                            pwdController.text);
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(
                                            rpxWidth(context, 40)),
                                        topRight: Radius.circular(
                                            rpxWidth(context, 40)))),
                                builder: (BuildContext context) {
                                  return Container(
                                    width: rpxWidth(context, 750),
                                    padding:
                                        EdgeInsets.all(rpxWidth(context, 40)),
                                    child: RegisterAgreement(
                                      onAccept: () {
                                        setState(() {
                                          index = 1;
                                        });
                                      },
                                    ),
                                  );
                                });
                          },
                          child: Text(
                            '立即注册',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: rpxFontSize(context, 35),
                                fontFamily: 'zhushi-Medium'),
                          ),
                        ),
                        FlatButton(
                          onPressed: () {},
                          child: Text(
                            '忘记密码',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: rpxFontSize(context, 35),
                                fontFamily: 'zhushi-Medium'),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: w,
                margin: EdgeInsets.only(top: rpxWidth(context, 60)),
                height: rpxWidth(context, 90),
                child: RaisedButton(
                  onPressed: btnEnable
                      ? () {
                          print("account ===> ${accountController.text}");
                          print("pwd ===> ${pwdController.text}");

                          Navigator.of(context).pushAndRemoveUntil(
                              new MaterialPageRoute(
                                  builder: (context) => new IndexPage()),
                              (route) => route == null);
                        }
                      : null,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(rpxWidth(context, 20))),
                  color: btnColor,
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
          RegisterBox(
            onLogin: () {
              setState(() {
                index = 0;
              });
            },
          )
        ],
      ),
    );
  }

  void judgeBtnStatus(BuildContext context, String account, String pwd) {
    if (account.length >= 11 && pwd.length >= 6) {
      setState(() {
        btnColor = ColorManager.colorAppTheme(context);
        btnEnable = true;
      });
    } else {
      setState(() {
        btnColor = Colors.grey;
        btnEnable = false;
      });
    }
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
      this.controller,
      this.width,
      this.obscureText,
      this.maxLength,
      this.icon,
      this.hintText,
      this.onValueChanged})
      : super(key: key);
  final TextEditingController controller;
  final double width;
  final bool obscureText;
  final int maxLength;
  final Icon icon;
  final String hintText;
  final VoidCallback onValueChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
            border: InputBorder.none,
            icon: icon,
            hintText: hintText,
            hintStyle: TextStyle(
                fontFamily: 'zhushi-Medium',
                fontSize: rpxFontSize(context, 35))),
        inputFormatters: <TextInputFormatter>[
          LengthLimitingTextInputFormatter(maxLength),
        ],
        style: TextStyle(fontSize: rpxFontSize(context, 35)),
        onChanged: (text) {
          onValueChanged();
        },
      ),
    );
  }
}

class RegisterAgreement extends StatefulWidget {
  RegisterAgreement({Key key, this.onAccept}) : super(key: key);
  final VoidCallback onAccept;

  @override
  _RegisterAgreementState createState() => _RegisterAgreementState();
}

class _RegisterAgreementState extends State<RegisterAgreement>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;
  int index = 0;
  Color foregroundColor = Colors.white10;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));
    _animation = CurvedAnimation(
            parent: _animationController, curve: Curves.easeInOutBack)
        .drive(Tween<double>(begin: 260, end: 30))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              setState(() {
                index = 1;
                foregroundColor = Colors.white70;
              });
              Future.delayed(Duration(milliseconds: 600), () {
                Navigator.pop(context);
                widget.onAccept();
              });
            }
          });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            AnimatedContainer(
              foregroundDecoration: BoxDecoration(color: foregroundColor),
              duration: Duration(milliseconds: 200),
              child: Column(
                children: <Widget>[
                  Text('注册协议',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: rpxFontSize(context, 40))),
                  SizedBox(
                    height: rpxWidth(context, 30),
                  ),
                  Text(
                      '当您开始下载、安装、使用、注册、登录乱炖，或使用乱炖相关服务时，即表示您已充分阅读、理解并接受本协议的全部内容，并与乱炖达成一致，成为乱炖“用户”。',
                      style: TextStyle(fontSize: rpxFontSize(context, 30))),
                  SizedBox(
                    height: rpxWidth(context, 30),
                  ),
                ],
              ),
            ),
            IndexedStack(
              alignment: Alignment.center,
              index: index,
              children: <Widget>[
                Container(
                  width: _animation.value,
                  height: 30,
                  child: RaisedButton(
                    color: Colors.blue,
                    onPressed: () {
                      _animationController.forward();
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Text('同意并继续'),
                  ),
                ),
                Container(
                  width: 30,
                  height: 30,
                  child: Image.asset(
                    'lib/images/login/border-success.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
