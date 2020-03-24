import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../config/device_config.dart';
import '../provide/home/lottery_provide.dart';
import 'package:provide/provide.dart';
import '../config/service_url.dart';
import '../service/service_method.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<DiscoverPage> {
  List lotteryTypeList = [];
  List<Map<String, dynamic>> dataList = [
    {'name': '彩票'}
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLotteryTypes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('工具箱'),
        ),
        body: ListView.builder(
          itemCount: dataList.length,
          itemBuilder: (context, index) {
            return _itemBuilder(dataList[index], index);
          },
        ));
  }

  Widget _itemBuilder(Map<String, dynamic> data, int index) {
    // List list = (index == 0) ? lotteryTypeList : data['list'];
    if (data['list'] == null) {
      return ListTile(
        title: Text(data['name']),
      );
    } else {
      return ExpansionTile(
        title: Text("hh"),
        children: lotteryTypeList.map((f) => _subItemBuilder(f)).toList(),
      );
    }
  }

  Widget _subItemBuilder(Map<String, dynamic> map) {
    return Container(
      child: Text("a"),
      padding: EdgeInsets.only(left: 30, top: 10, bottom: 10, right: 10),
      width: screenWidth,
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Color(0xffe5e5e5), width: 1))),
    );
  }

  getLotteryTypes() async {
    await get(lotteryTypes).then((val) {
      setState(() {
        lotteryTypeList = val['data'];
      });
    });
  }
}
