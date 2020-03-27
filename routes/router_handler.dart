import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_project/provide/discover/qrcode_provide.dart';
import '../pages/web_page.dart';
import '../pages/home/search_page.dart';
import '../pages/discover/qrcode_detail_page.dart';
import '../pages/discover/lottery_detail_page.dart';
import 'dart:convert' as convert;

//web页
Handler webHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String itemUrl = params['webUrl']?.first;
  return WebPage(webUrl: itemUrl);
});

//搜索
Handler searchHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SearchPage();
});

//彩票详情
Handler lotteryDetailHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String data = params['dataStr']?.first;
  Map<String, dynamic> map = convert.jsonDecode(data);
  return LotteryDetailPage(dataDic: map);
});

//二维码
Handler qrcodeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {

  String type = params['type']?.first;
  QrcodeType codeType = QrcodeType.single;
  if (type == 'single') {
    codeType = QrcodeType.single;
  }else {
    codeType = QrcodeType.logo;
  }
  
  return QrCodeDetailPage(qrcodeType: codeType,);
});
