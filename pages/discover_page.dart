import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_project/model/discover/movie_model.dart';
import 'package:flutter_project/pages/discover/movie_detail_page.dart';
import 'package:flutter_project/routes/routes.dart';
import 'package:flutter_project/service/service_method.dart';
import '../config/service_url.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../config/device_config.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  MovieModel movieModel;

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('电影🎬'),
        ),
        body: movieModel == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : GridView.count(
                crossAxisCount: 2,
                childAspectRatio: nWidth(270.0) / nWidth(450.0),
                children: movieModel.subjects
                    .map((itemModel) => InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MovieDetailPage(
                                          movieItemModel: itemModel,
                                        )));
                          },
                          child: Card(
                            margin: EdgeInsets.all(nWidth(20)),
                            child: Column(
                              children: <Widget>[
                                Hero(
                                  tag: itemModel.title,
                                  child: Container(
                                    width: nWidth(335),
                                    height: nWidth(335 * 400 / 270.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(nWidth(20)),
                                          topRight:
                                              Radius.circular(nWidth(20))),
                                      child: CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageUrl: itemModel.images.small,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: nWidth(30),
                                ),
                                Text(itemModel.title,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: nFontSize(30)))
                              ],
                            ),
                          ),
                        ))
                    .toList(),
              ));
  }

  void getData() async {
    await get(doubanTop250).then((val) {
      movieModel = MovieModel.fromJson(val);
    });
    setState(() {});
  }
}
