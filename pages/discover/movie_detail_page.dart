import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/config/device_config.dart';
import 'package:flutter_project/model/discover/movie_model.dart';

class MovieDetailPage extends StatelessWidget {
  MovieDetailPage({Key key, this.movieItemModel}) : super(key: key);
  final MovieItemModel movieItemModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        brightness: Brightness.light,
        elevation: 0.0,
        title: Text('${movieItemModel.title}'),
      ),
      body: Column(
        children: <Widget>[
          MovieDetailInfo(
            itemModel: movieItemModel,
          ),
          RateInfo()
        ],
      ),
    );
  }
}

class MovieDetailInfo extends StatelessWidget {
  MovieDetailInfo({Key key, this.itemModel}) : super(key: key);
  final MovieItemModel itemModel;
  @override
  Widget build(BuildContext context) {
    String genres = itemModel.genres.join(' ');
    String publishTime = '${itemModel.pubdates.first}上映';
    String duration = '片长${itemModel.durations.first}';
    String movieInfo = [genres, publishTime, duration].join(' / ');
    return Container(
      width: screenWidth,
      padding: EdgeInsets.all(nWidth(20)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Hero(
            tag: itemModel.title,
            child: Container(
              width: nWidth(220),
              height: nWidth(400 * 220 / 270.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(nWidth(20)),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: itemModel.images.small,
                ),
              ),
            ),
          ),
          Container(
            width: nWidth(750 * 0.6),
            padding: EdgeInsets.only(left: nWidth(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${itemModel.title}',
                  style: TextStyle(
                      fontSize: nFontSize(50),
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: nWidth(10),
                ),
                Text('${itemModel.originalTitle}(${itemModel.year})',
                    style: TextStyle(
                        fontSize: nFontSize(30), color: Colors.white)),
                SizedBox(
                  height: nWidth(20),
                ),
                Text(
                  '$movieInfo',
                  style: TextStyle(
                      fontSize: nFontSize(20), color: Colors.grey[300]),
                ),
                SizedBox(
                  height: nWidth(30),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: nWidth(180),
                        height: nWidth(70),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(nWidth(10))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[Icon(Icons.add_box), Text("想看")],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: nWidth(180),
                        height: nWidth(70),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(nWidth(10))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.star_border),
                            Text("看过")
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class RateInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[Text("豆瓣评分™"), Icon(Icons.keyboard_arrow_right)],
          )
        ],
      ),
    );
  }
}
