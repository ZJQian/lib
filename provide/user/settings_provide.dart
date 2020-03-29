import 'package:flutter/material.dart';
import 'package:flutter_project/routes/routes.dart';

enum PageType {
  theme,//皮肤
}

class SettingsProvide with ChangeNotifier {
  
  fromSettingsPageToNextPage(BuildContext context,PageType pageType) {
    if (pageType == PageType.theme) {
      Routes.navigateTo(context, Routes.themePage);
    }
  }
}