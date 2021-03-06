import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './router_handler.dart';

class Routes {
  //配置类
  static Router _router;
  static String root = '/'; //根目录
  static String webPage = '/web'; //详情页面
  static String searchPage = '/search'; //搜索页面
  static String lotteryDetailPage = '/lotteryDetail'; //搜索页面
  static String qrcodeDetailpage = '/qrcodeDetail'; //二维码页面
  static String settingsPage = '/settingsPage'; //设置页面
  static String themePage = '/themePage'; //皮肤页面
  static String welfarePage = '/welfarePage'; //福利页面
  static String movieDetailPage = '/movieDetailPage'; //电影详情页面

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
    router.define(lotteryDetailPage, handler: lotteryDetailHandler);
    router.define(qrcodeDetailpage, handler: qrcodeHandler);
    router.define(settingsPage, handler: settingsHandler);
    router.define(themePage, handler: themeHandler);
    router.define(welfarePage, handler: welfareHandler);
    router.define(movieDetailPage, handler: movieDetailHandler);
  }

  //路由跳转
  static navigateTo(BuildContext context, String path,
      {Map<String, dynamic> params,
      TransitionType transition = TransitionType.inFromRight}) {
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
