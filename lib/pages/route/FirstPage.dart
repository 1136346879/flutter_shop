import 'package:flutter/material.dart';
import 'package:flutter_hexun/pages/route/NewPage.dart';
import './MyHomePage.dart';
import './TwoPage.dart';


class FirstPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: 'Flutter高级进阶',
      routes: {
//        "newPage": (context) => new NewPage(text: '注册路由名的新页面'),//注册路由名
//        // 第二个路由名
        "towPage": (context) => new TowPage(),//注册路由名
//        // 首页路由名
//        "/": (context) => new MyHomePage(),//注册路由名
      },
      home: new MyHomePage(),//这个必须注释，因为我们注册了根路由名："/"，否则报错
    );
  }
}