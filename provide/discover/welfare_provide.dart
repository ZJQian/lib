import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../service/service_method.dart';
import '../../config/service_url.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

enum PullToRefreshType {
  pullup, //上拉加载
  pulldown, //下拉刷新
}

class WelfareProvide with ChangeNotifier {
  List dataList = [];
  int page = 1;
  //获取福利列表
  getWelfarePullDownList(RefreshController refreshController) async {
    page = 1;
    Map params = {'page': page};
    await get(welfare, formData: params).then((val) {
      dataList = val['data']['list'];
      refreshController.refreshCompleted();
      notifyListeners();
    });
  }

  getWelfarePullUpList(RefreshController refreshController) async {
    page++;
    Map params = {'page': page};
    await get(welfare, formData: params).then((val) {
      List tempList = val['data']['list'];
      if (tempList.length == 0 || tempList == null) {
        refreshController.loadNoData();
      } else {
        dataList.addAll(tempList);
        refreshController.loadComplete();
      }
      notifyListeners();
    });
  }
}
