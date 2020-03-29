import 'package:flutter/material.dart';
import 'package:flutter_project/config/app_theme.dart';

class AppThemeProvide with ChangeNotifier {
  
  ThemeData themeData = appThemeData[AppTheme.greenLight];
  changeTheme(AppTheme appTheme) {
    themeData = appThemeData[appTheme];
    notifyListeners();
  }
}