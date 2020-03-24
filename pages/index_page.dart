import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'library_page.dart';
import 'discover_page.dart';
import 'user_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../provide/currentIndex_provide.dart';

class IndexPage extends StatelessWidget {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text("首页")),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search), title: Text("工具")),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.bookmark), title: Text("书架")),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.person), title: Text("我的")),
  ];

  final List<Widget> pages = [
    HomePage(),
    DiscoverPage(),
    LibraryPage(),
    UserPage()
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Provide<CurrentIndexProvide>(
      builder: (context, child, val) {
        int currentIndex =
            Provide.value<CurrentIndexProvide>(context).currentIndex;
        return Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: CupertinoTabBar(
            backgroundColor: Colors.white,
            currentIndex: currentIndex,
            items: bottomTabs,
            onTap: (index) {
              Provide.value<CurrentIndexProvide>(context).changeIndex(index);
            },
          ),
          body: IndexedStack(
            index: currentIndex,
            children: pages,
          ),
        );
      },
    );
  }
}
