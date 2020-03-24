import 'package:flutter_screenutil/flutter_screenutil.dart';

double screenWidth = ScreenUtil().setWidth(750);
double screenHeight = ScreenUtil().setHeight(1334);

//宽度适配
double nWidth(double width) {
  return ScreenUtil().setWidth(width);
}

//高度适配
double nHieght(double height) {
  return ScreenUtil().setHeight(height);
}

//字体大小适配
double nFontSize(double fontSize) {
  return ScreenUtil().setSp(fontSize);
}
