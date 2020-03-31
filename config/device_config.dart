import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

double screenWidth = ScreenUtil().setWidth(750);
double screenHeight = ScreenUtil().setHeight(1334);

//宽度适配
double nWidth(double width) {
  return ScreenUtil().setWidth(width);
}

double rpxWidth(BuildContext context, double width) {
  double rpx = MediaQuery.of(context).size.width / 750.0;
  return width * rpx;
}

double rpxFontSize(BuildContext context, double fontSize) {
  double rpx = MediaQuery.of(context).size.width / 750.0;
  return fontSize * rpx;
}

//高度适配
double nHieght(double height) {
  return ScreenUtil().setHeight(height);
}

//字体大小适配
double nFontSize(double fontSize) {
  return ScreenUtil().setSp(fontSize);
}
