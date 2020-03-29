import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_project/config/color_config.dart';
import 'package:flutter_project/config/device_config.dart';
import 'package:flutter_project/provide/user/settings_provide.dart';
import 'package:provide/provide.dart';

class SettingsPage extends StatelessWidget {
  final List dataList = [
    {'name': '更换皮肤', 'type': PageType.theme}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("设置"),
      ),
      body: Provide<SettingsProvide>(
        builder: (context, child, provide) {
          return ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                return _itemBuilder(context,dataList[index]);
              });
        },
      ),
    );
  }

  Widget _itemBuilder(BuildContext context,Map<String, dynamic> data) {
    return InkWell(
      onTap: () {
        PageType pageType = data['type'];
        Provide.value<SettingsProvide>(context).fromSettingsPageToNextPage(context, pageType);
      },
      child: Container(
          width: screenWidth,
          padding: EdgeInsets.only(
              left: nWidth(40),
              top: nWidth(20),
              bottom: nWidth(20),
              right: nWidth(20)),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: ColorManager.color_line, width: 1))),
          child: Text("${data['name']}")),
    );
  }
}
