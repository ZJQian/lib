import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../service/service_method.dart';
import '../config/service_url.dart';
import '../model/home/ganktoday_model.dart';
import '../config/device_config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../routes/application.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<List<GankItemModel>> gankItems = [];
  List<String> gankCategories = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: this.gankCategories.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("干货集中营"),
          bottom: TabBar(
            tabs: this
                .gankCategories
                .map((f) => Tab(
                      text: f,
                    ))
                .toList(),
            isScrollable: true,
          ),
        ),
        body: TabBarView(
          children: this
              .gankItems
              .map((f) => ListView.builder(
                    itemCount: f.length,
                    itemBuilder: (context, index) {
                      return _itemBuilder(f[index]);
                    },
                  ))
              .toList(),
        ),
      ),
    );
  }

  _itemBuilder(GankItemModel itemModel) {
    return InkWell(
      onTap: () {
        Application.router.navigateTo(context, '/web');
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

  _getData() async {
    await get(gankToday).then((val) {
      GankTodayModel gankTodayModel = GankTodayModel.fromJson(val);
      List<List<GankItemModel>> list = [];
      for (var item in gankTodayModel.category) {
        List<GankItemModel> array = [];
        List tempArray = gankTodayModel.results[item];
        for (var tempItem in tempArray) {
          GankItemModel itemModel = GankItemModel.fromJson(tempItem);
          array.add(itemModel);
        }
        list.add(array);
      }
      setState(() {
        gankCategories = gankTodayModel.category;
        gankItems = list;
      });
    });
  }
}
