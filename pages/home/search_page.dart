import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../service/service_method.dart';
import '../../config/service_url.dart';
import 'package:provide/provide.dart';
import '../../provide/home/search_provide.dart';
import '../../views/home/gank_item.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    final searchProvide = Provide.value<SearchProvide>(context);
    return Scaffold(
      appBar: AppBar(
        title: buildTextField(context, controller),
        centerTitle: true,
      ),
      body: Provide<SearchProvide>(
        // builder: (context, child, provide) => Text("${provide.list.length}")
        builder: (context, child, provide) => ListView.builder(
          itemCount: provide.list.length,
          itemBuilder: (context, index) {
            return gankSearchItem(context, provide.list[index]);
          },
        ),
      ),
    );
  }

  Widget buildTextField(
      BuildContext context, TextEditingController controller) {
    return TextField(
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(filled: false, hintText: "搜索..."),
      onSubmitted: (text) {
        Provide.value<SearchProvide>(context).searchResults(text);
      },
    );
  }

  void _getData(String text) async {
    String url = gankSearch + "/$text/category/all/count/50/page/1";
    await get(url).then((val) {});
  }
}
