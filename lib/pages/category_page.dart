import 'package:flutter/material.dart';
import '../pages/route/MyHomePage.dart';

class CategoryPage extends StatelessWidget {

  final navKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return  new  MaterialApp(
      navigatorKey: navKey,// 设置navigatorKey
      home: Scaffold(
        appBar: new AppBar(),
//      body: Center(child:Text("商品分类")),
    body: new FlatButton(child: new Text("商品分类"), onPressed: () => pushNoContext(),)
      )
    );
  }

  pushNoContext() {
    //导航到新路由
   navKey .currentState.push(
      MaterialPageRoute(
        // MyHomePage不写参数则默认为1
          builder: (context) => MyHomePage()),
    );
  }
  }

