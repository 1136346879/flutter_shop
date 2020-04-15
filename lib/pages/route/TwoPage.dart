import 'package:flutter/material.dart';
import 'package:flutter_hexun/pages/route/NewPage.dart';
import './MyHomePage.dart';
class TowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text('页面二')),
      body: new RaisedButton(
//        onPressed: () => Navigator.popUntil(context, ModalRoute.withName('/')),//使用popUntil方法返回到我们想要返回到的某个路由，
//        onPressed: () => Navigator.popUntil(context, ModalRoute.withName('newPage')),//使用popUntil方法返回到我们想要返回到的某个路由，
        onPressed: () => Navigator.popUntil(
          context,
          // 使用记录好的路由名字
          ModalRoute.withName(NewPage().toStringShort()),
        ),
        child: new Text("返回到首页"),
      ),
    );
  }
}