import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../service/service_method.dart';
import '../config/service_url.dart';
import '../model/home/ganktoday_model.dart';
import '../config/device_config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../routes/application.dart';
import '../routes/routes.dart';
import '../views/home/gank_item.dart';

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
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Routes.navigateTo(context, Routes.searchPage);
              },
            )
          ],
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
                      return gankItem(context, f[index]);
                    },
                  ))
              .toList(),
        ),
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
