import 'package:flutter/material.dart';
import '../../model/home/ganksearch_model.dart';
import '../../service/service_method.dart';
import '../../config/service_url.dart';

class SearchProvide with ChangeNotifier {
  List<GankSearchItemModel> list = [];
  searchResults(String text) async {
    String url = gankSearch + "/$text/category/all/count/50/page/1";
    await get(url).then((val) {
      GankSearchModel model = GankSearchModel.fromJson(val);
      list = model.results;
      notifyListeners();
    });
  }
}
