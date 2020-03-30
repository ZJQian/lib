import 'package:flutter/material.dart';
import 'package:flutter_project/provide/app_theme_provide.dart';
import 'package:flutter_project/provide/user/settings_provide.dart';
import './pages/index_page.dart';
import 'package:provide/provide.dart';
import 'provide/currentIndex_provide.dart';
import 'provide/home/search_provide.dart';
import 'provide/home/lottery_provide.dart';
import 'provide/discover/qrcode_provide.dart';
import 'provide/discover/welfare_provide.dart';
import 'package:fluro/fluro.dart';
import 'routes/routes.dart';
import 'routes/application.dart';

void main() {
  var currentIndexProvide = CurrentIndexProvide();
  var searchTextProvide = SearchProvide();
  var lotteryProvide = LotteryProvide();
  var qrcodeProvide = QrcodeProvide();
  var settingsProvide = SettingsProvide();
  var appThemeProvide = AppThemeProvide();
  var welfareProvide = WelfareProvide();
  var providers = Providers();
  providers.provide(Provider<AppThemeProvide>.value(appThemeProvide));
  providers.provide(Provider<CurrentIndexProvide>.value(currentIndexProvide));
  providers.provide(Provider<SearchProvide>.value(searchTextProvide));
  providers.provide(Provider<LotteryProvide>.value(lotteryProvide));
  providers.provide(Provider<QrcodeProvide>.value(qrcodeProvide));
  providers.provide(Provider<SettingsProvide>.value(settingsProvide));
  providers.provide(Provider<WelfareProvide>.value(welfareProvide));

  runApp(ProviderNode(child: MyApp(), providers: providers));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = Router(); //路由初始化
    Routes.configureRoutes(router);
    Application.router = router;

    return Provide<AppThemeProvide>(
      builder: (context, child, provide) {
        return MaterialApp(
          title: 'Flutter Demo',
          onGenerateRoute: Application.router.generator,
          theme: Provide.value<AppThemeProvide>(context).themeData,
          home: IndexPage(),
        );
      },
    );
  }
}
