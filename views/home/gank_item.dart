import 'package:flutter/material.dart';
import '../../model/home/ganktoday_model.dart';
import '../../model/home/ganksearch_model.dart';
import '../../routes/routes.dart';
import '../../config/device_config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//干货列表item
Widget gankItem(BuildContext context, GankItemModel itemModel) {
  return InkWell(
    onTap: () {
      String webUrl = itemModel.url;
      Routes.navigateTo(context, Routes.webPage, params: {"webUrl": webUrl});
    },
    child: Container(
      width: screenWidth,
      padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(itemModel.desc),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.person,
                        color: Colors.blue,
                      ),
                      Text(itemModel.who)
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.timer,
                        color: Colors.blue,
                      ),
                      Text(itemModel.publishedAt.substring(0, 10))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1, color: Color(0xffe5e5e5)))),
    ),
  );
}

//干货列表item
Widget gankSearchItem(BuildContext context, GankSearchItemModel itemModel) {
  return InkWell(
    onTap: () {
      String webUrl = itemModel.url;
      Routes.navigateTo(context, Routes.webPage, params: {"webUrl": webUrl});
    },
    child: Container(
      width: screenWidth,
      padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(itemModel.desc),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.person,
                        color: Colors.blue,
                      ),
                      Text(itemModel.who)
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.timer,
                        color: Colors.blue,
                      ),
                      Text(itemModel.publishedAt.substring(0, 10))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1, color: Color(0xffe5e5e5)))),
    ),
  );
}
