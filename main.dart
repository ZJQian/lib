import 'package:flutter/material.dart';
import './pages/index_page.dart';
import 'package:provide/provide.dart';
import 'provide/currentIndex_provide.dart';
import 'provide/home/search_provide.dart';
import 'provide/home/lottery_provide.dart';
import 'package:fluro/fluro.dart';
import 'routes/routes.dart';
import 'routes/application.dart';

void main() {
  var currentIndexProvide = CurrentIndexProvide();
  var searchTextProvide = SearchProvide();
  var lotteryProvide = LotteryProvide();
  var providers = Providers();
  providers.provide(Provider<CurrentIndexProvide>.value(currentIndexProvide));
  providers.provide(Provider<SearchProvide>.value(searchTextProvide));
  providers.provide(Provider<LotteryProvide>.value(lotteryProvide));

  runApp(ProviderNode(child: MyApp(), providers: providers));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = Router(); //路由初始化
    Routes.configureRoutes(router);
    Application.router = router;

    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: Application.router.generator,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IndexPage(),
    );
  }
}
