import 'package:flutter/material.dart';
import 'package:flutter_project/config/device_config.dart';
import 'package:flutter_project/pages/login/login_box.dart';

class RegisterBox extends StatefulWidget {
  RegisterBox({Key key, this.onLogin, this.opacity}) : super(key: key);
  final VoidCallback onLogin;
  final double opacity;

  @override
  _RegisterBoxState createState() => _RegisterBoxState();
}

class _RegisterBoxState extends State<RegisterBox> {
  @override
  Widget build(BuildContext context) {
    double margin = rpxWidth(context, 40);
    double w = rpxWidth(context, 750) - 2 * margin;
    final TextEditingController accountController = TextEditingController();
    final TextEditingController pwdController = TextEditingController();
    final TextEditingController confirmPwdController = TextEditingController();

    return Opacity(
      opacity: 1,
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
                  maxLength: 11,
                  icon: Icon(
                    Icons.face,
                    size: rpxWidth(context, 40),
                  ),
                  hintText: "请输入账号/手机号",
                  onValueChanged: () {},
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
                  onValueChanged: () {},
                ),
                LoginTitle(
                  title: "确认密码",
                ),
                LoginTextFiled(
                  controller: confirmPwdController,
                  width: w,
                  obscureText: true,
                  maxLength: 15,
                  icon: Icon(
                    Icons.lock,
                    size: rpxWidth(context, 40),
                  ),
                  hintText: "请再次输入密码",
                  onValueChanged: () {},
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        widget.onLogin();
                      },
                      child: Text(
                        '返回登录',
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
            height: rpxWidth(context, 90),
            margin: EdgeInsets.only(top: rpxWidth(context, 60)),
            child: RaisedButton(
              onPressed: null,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(rpxWidth(context, 20))),
              color: Colors.blue,
              child: Text(
                '注册',
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
