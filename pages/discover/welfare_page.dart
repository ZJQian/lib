import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:provide/provide.dart';
import '../../provide/discover/welfare_provide.dart';
import 'photo_gallery_page.dart';

class WelfarePage extends StatefulWidget {
  WelfarePage({Key key}) : super(key: key);
  @override
  _WelfarePageState createState() => _WelfarePageState();
}

class _WelfarePageState extends State<WelfarePage> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: true);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("福利场")),
      body: Provide<WelfareProvide>(
        builder: (context, child, provide) {
          return SmartRefresher(
            controller: _refreshController,
            enablePullUp: true,
            header: ClassicHeader(),
            onRefresh: () {
              Provide.value<WelfareProvide>(context)
                  .getWelfarePullDownList(_refreshController);
              _refreshController.refreshCompleted();
            },
            onLoading: () {
              Provide.value<WelfareProvide>(context)
                  .getWelfarePullUpList(_refreshController);
              _refreshController.loadComplete();
            },
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              itemCount: provide.dataList.length,
              primary: false,
              itemBuilder: (BuildContext context, int index) {
                List<String> imgs = provide.dataList
                    .map((f) => f["imageUrl"].toString())
                    .toList();

                Map dic = provide.dataList[index];
                return WelfareItem(
                  imgs: imgs,
                  dataDic: dic,
                  index: index,
                );
              },
              staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            ),
          );
        },
      ),
    );
  }
}

class WelfareItem extends StatelessWidget {
  final List<String> imgs;
  final Map<dynamic, dynamic> dataDic;
  final int index;
  WelfareItem({this.imgs, this.dataDic, this.index});

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: "tag-${this.index}",
        child: Material(
          color: Colors.black,
          child: InkWell(
              onTap: () {
                Navigator.push(context, PageRouteBuilder(pageBuilder:
                    (BuildContext context, Animation animation,
                        Animation secondaryAnimation) {
                  return new FadeTransition(
                    opacity: animation,
                    child: Scaffold(
                      body: PhotoGalleryPage(
                        images: imgs, //传入图片list
                        index: index, //传入当前点击的图片的index
                      ),
                    ),
                  );
                }));
              },
              child: Container(
                child: CachedNetworkImage(imageUrl: this.dataDic['imageUrl']),
              )),
        ));
  }
}
