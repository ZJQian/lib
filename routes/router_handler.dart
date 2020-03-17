import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/web_page.dart';
import '../pages/home/search_page.dart';

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
