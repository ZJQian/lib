import 'package:flutter/material.dart';
import '../../service/service_method.dart';
import '../../config/service_url.dart';


class LotteryDetailPage extends StatefulWidget {

  LotteryDetailPage({Key key, @required this.dataDic}) : super(key: key);
  final Map<String, dynamic> dataDic;

  @override
  _State createState() => _State();
}

class _State extends State<LotteryDetailPage> {

  String lotteryInfo = "";


  @override
  void initState() {
    super.initState();

    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.dataDic['name'] ?? ""),
      ),
      body: Center(
        child: Container(
          child: Text(lotteryInfo),
        ),
      ),
    );
  }

  _getData() async {
    await get(lotteryLatest,formData: {'code':widget.dataDic['type']}).then((val) {
      setState(() {
        lotteryInfo = val['data']['openCode'];
      });
    });
  }
}