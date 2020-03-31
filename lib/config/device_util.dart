import 'package:flutter/material.dart';
//媒体查询（MediaQuery）
// 整屏宽度    _dx
double winWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}
// 整屏高度  _dx
double winHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

// 屏幕密度
double winMd(BuildContext context) {
  return MediaQuery.of(context).devicePixelRatio;
}