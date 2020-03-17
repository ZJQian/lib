import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebPage extends StatelessWidget {
  WebPage({String webUrl = ""}) : this.webUrl = webUrl;

  final String webUrl;
  @override
  Widget build(BuildContext context) {
    print(webUrl);
    return WebviewScaffold(
      appBar: AppBar(
        title: Text("web"),
      ),
      url: webUrl,
    );
  }
}
