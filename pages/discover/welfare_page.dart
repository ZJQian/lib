import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/service/service_method.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../config/service_url.dart';

class WelfarePage extends StatefulWidget {
  WelfarePage({Key key}) : super(key: key);
  @override
  _WelfarePageState createState() => _WelfarePageState();
}

class _WelfarePageState extends State<WelfarePage> {

  List dataList = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("福利场")),
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: dataList.length,
        primary: false,
        itemBuilder: (BuildContext context, int index) {
          Map dic = dataList[index];
          return WelfareItem(dataDic :dic);
        },
        staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }

  void _getData() async {
    await get(welfare).then((val) {
      setState(() {
        dataList = val['data'];
      });
    });
  }
}



class WelfareItem extends StatelessWidget {
  final Map<dynamic,dynamic> dataDic;
  WelfareItem({this.dataDic});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() {},
      child: Container(
        child: CachedNetworkImage(imageUrl: this.dataDic['imageUrl']),
      )
    );
  }
}
