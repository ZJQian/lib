import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PhotoGalleryPage extends StatefulWidget {
  List images = [];
  int index = 0;
  final String heroTag;
  PageController controller;
  final LoadingBuilder loadingBuilder;

  PhotoGalleryPage(
      {Key key,
      @required this.images,
      this.loadingBuilder,
      this.index,
      this.controller,
      this.heroTag})
      : super(key: key) {
    controller = PageController(initialPage: index);
  }

  @override
  _PhotoGalleryPageState createState() => _PhotoGalleryPageState();
}

class _PhotoGalleryPageState extends State<PhotoGalleryPage> {
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: "tag-$currentIndex",
        child: Material(
          color: Colors.black,
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: PhotoViewGallery.builder(
                    scrollPhysics: const BouncingScrollPhysics(),
                    builder: (BuildContext context, int index) {
                      return PhotoViewGalleryPageOptions(
                        imageProvider: NetworkImage(widget.images[index]),
                      );
                    },
                    itemCount: widget.images.length,
                    loadingBuilder: widget.loadingBuilder,
                    backgroundDecoration: const BoxDecoration(
                      color: Colors.black,
                    ),
                    pageController: widget.controller,
                    enableRotation: true,
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                ),
                Positioned(
                  //图片index显示
                  top: MediaQuery.of(context).padding.top + 15,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text("${currentIndex + 1}/${widget.images.length}",
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
