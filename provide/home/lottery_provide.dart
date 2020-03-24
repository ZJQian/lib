import 'package:flutter/material.dart';
import '../../service/service_method.dart';
import '../../config/service_url.dart';

class LotteryProvide with ChangeNotifier {
  //获取彩种列表
  /*
          {
            "typeName": "双色球",
            "typeCode": "ssq",
            "openTime": "每周二、四、日开奖",
            "startTime": "2003年2月16日",
            "ruleDesc": null
          },
    */
  List list = [];
  getLotteryTypes() async {
    await get(lotteryTypes).then((val) {
      list = val['data'];
      notifyListeners();
    });
  }
}
