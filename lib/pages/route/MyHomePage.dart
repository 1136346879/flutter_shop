import 'package:flutter/material.dart';
import 'package:flutter_hexun/pages/route/NewPage.dart';
class MyHomePage extends StatefulWidget {
  // 接收的num参数
  final int num;
  // MyHomePage不写参数则默认为1
  MyHomePage({this.num = 1});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // 显示接收的num参数
      appBar: new AppBar(title: new Text('Flutter高级进阶${widget.num}')),
      // 按钮点击执行跳转方法
      body: new FlatButton(child: new Text("push"), onPressed: () =>
//          push()
//          pushName()
          pushSetName()
      ),
    );
  }
  /*
   * 路由跳转方法
   * */
  push() {
    // 拿到传过来的num然后+1
    int num = widget.num + 1;
    //导航到新路由
    Navigator.push(
      context,
      MaterialPageRoute(
        // num传给下一级
          builder: (context) => MyHomePage(num: num)),
    );
  }

  /*
 * 路由跳转方法  用手动注册de路由名
 * */
  pushName() {
    Navigator.pushNamed(context, "newPage").then((value) {
      if (value != null) print('接收到的参数：$value');
    });
  }


  /*
 * 路由跳转方法
 * */
  pushSetName() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NewPage(text:"------"),
        settings: new RouteSettings(
          name: NewPage(text:"------").toStringShort(), // 设置的路由名
          isInitialRoute: false, // 是否初始路由
        ),
      ),
    );
  }
}