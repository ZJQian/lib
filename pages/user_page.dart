import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/routes/routes.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("个人中心"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Routes.navigateTo(context, Routes.settingsPage);
              })
        ],
      ),
      body: Container(
        child: Center(
          child: Text("User"),
        ),
      ),
    );
  }
}
