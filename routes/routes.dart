import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './router_handler.dart';

class Routes {
  //配置类
  static Router _router;
  static String root = '/'; //根目录
  static String webPage = '/web'; //详情页面
  static String searchPage = '/search'; //搜索页面
  //静态方法
  static void configureRoutes(Router router) {
    _router = router;
    //路由配置
    //找不到路由
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print('ERROR====>ROUTE WAS NOT FONUND!!!');
    });
    //整体配置

    router.define(webPage, handler: webHandler);
    router.define(searchPage, handler: searchHandler);
  }

  //路由跳转
  static navigateTo(BuildContext context, String path,
      {Map<String, dynamic> params,
      TransitionType transition = TransitionType.native}) {
    String query = "";
    int index = 0;
    if (params != null) {
      for (var key in params.keys) {
        var value = Uri.encodeComponent(params[key]);
        if (index == 0) {
          query = "?";
        } else {
          query = query + "\$";
        }
        query += "$key=$value";
        index++;
      }
    }

    path = path + query;
    _router.navigateTo(context, path, transition: transition);
  }
}
