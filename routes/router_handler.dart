import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/web_page.dart';

Handler webHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String itemUrl = params['id'].first;
  return WebPage(itemUrl);
});
