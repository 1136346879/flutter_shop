import 'package:flutter/cupertino.dart';

/*
* 渐变动画
* */
class FadeRoute extends PageRouteBuilder {
  // 传过来的页面page
  final Widget page;
  // 构造
  FadeRoute({this.page})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        FadeTransition(
          opacity: animation, // 透明度
          child: child, // 页面存放
        ),
  );
}