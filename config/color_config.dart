import 'package:flutter/material.dart';
import 'package:flutter_project/provide/app_theme_provide.dart';
import 'package:provide/provide.dart';

class ColorManager {
  static const color_line = Color(0xffe5e5e5);
  static colorAppTheme(BuildContext context) {
    
    return Provide.value<AppThemeProvide>(context).themeData.primaryColor;
  }
}