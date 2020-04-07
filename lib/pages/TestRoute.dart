import 'package:flutter/material.dart';

/**
 * 当我们调用有状态类的setState方法时会遍历每一个子Widget的State.build刷新状态， 这将是一笔很大的性能开销，所以我们需要使用局部刷新来进行优化。
 * 一个有状态类定义一个变量然后按钮的事件调用setState让这个变量进行刷新，
 */
class TestRoute extends StatefulWidget {
  @override
  _TestRouteState createState() => _TestRouteState();
}

class _TestRouteState extends State<TestRoute> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(title: Text("普通刷新")),
    body:
      new FlatButton(
      onPressed: () {
        setState(() => count++);
      },
      child: new Text('$count',style: TextStyle(color: Colors.white,fontSize: 25),),
    ),
    );
  }
}