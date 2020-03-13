import 'package:flutter/material.dart';

class CurrentIndexProvide with ChangeNotifier {
  //当前tabbar索引值
  int currentIndex = 0;
  changeIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }
}
