import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../config/device_config.dart';
import '../routes/routes.dart';
import 'dart:convert' as convert;

class DiscoverPage extends StatelessWidget {
  final List<Map<String, dynamic>> dataList = [
    {
      'name': '彩票',
      'list': [
        {'name': '双色球', 'type': 'ssq'},
        {'name': '七乐彩', 'type': 'qlc'},
        {'name': '福彩3D', 'type': 'fc3d'},
        {'name': '超级大乐透', 'type': 'cjdlt'},
        {'name': '七星彩', 'type': 'qxc'},
        {'name': '排列3', 'type': 'pl3'},
        {'name': '排列5', 'type': 'pl5'},
      ]
    },
    {
      'name': '二维码',
      'list': [
        {'name': '普通二维码'},
        {'name': '带logo二维码'}
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("小工具"),
      ),
      body: ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          return _itemBuilder(context, dataList[index], index);
        },
      ),
    );
  }

  Widget _itemBuilder(
      BuildContext context, Map<String, dynamic> data, int index) {
    List list = data['list'];
    if (list == null) {
      return Text(data['name']);
    } else {
      return ExpansionTile(
        title: Text(data['name']),
        children: list.map((f) => _subItemBuilder(context, f, index)).toList(),
      );
    }
  }

  Widget _subItemBuilder(
      BuildContext context, Map<String, String> data, int index) {
    return InkWell(
      onTap: () {
        if (index == 0) {
          Routes.navigateTo(context, Routes.lotteryDetailPage,
              params: {'dataStr': convert.jsonEncode(data)});
        } else if (index == 1) {
          Routes.navigateTo(context, Routes.qrcodeDetailpage);
        }
      },
      child: Container(
        width: screenWidth,
        margin: EdgeInsets.only(left: nWidth(60)),
        padding: EdgeInsets.only(
            top: nWidth(20), bottom: nWidth(20), right: nWidth(20)),
        child: Text(data['name']),
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.black12, width: 1))),
      ),
    );
  }
}
