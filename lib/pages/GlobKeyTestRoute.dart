import 'package:flutter/material.dart';

/**
 * 使用GlobalKey局部刷新方式
    我们还是用上面的例子，只是通过GlobalKey的方式只刷新局部的Text，
    效果：
    可以明显的看到按钮的count并无变动，但需要更新的文本组件更新了值，已经完美实现了局部刷新。
    实现原理：
    textKey是一个GlobalKey类型的Key范型为TextWidgetState（封装的文本&&有状态类），
    所以这个Key可以通过currentState方法调用到类里面的onPressed方法， 而onPressed方法刚好有调用setState来刷新局部状态。
 */
class GlobKeyTestRoute extends StatefulWidget {
  @override
  _TestRouteState createState() => _TestRouteState();
}

class _TestRouteState extends State<GlobKeyTestRoute> {
  int count = 0;

  GlobalKey<TextWidgetState> textKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return  new Scaffold(
        appBar: AppBar(title: Text("局部刷新优化")),
    body:new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new TextWidget(textKey), //需要更新的Text
        new FlatButton(
          onPressed: () {
            count++; // 这里我们只给他值变动，状态刷新交给下面的Key事件
            textKey.currentState.onPressed(count);
          },
          child: new Text('按钮 $count'),
        ),
      ],
    ),
    );
  }
}

// 封装的文本组件Widget
class TextWidget extends StatefulWidget {
  final Key key;

  // 接收一个Key
  TextWidget(this.key);

  @override
  State<StatefulWidget> createState() => TextWidgetState();
}

class TextWidgetState extends State<TextWidget> {
  String _text = "0";

  @override
  Widget build(BuildContext context) {
    return new Text(_text);
  }

  void onPressed(int count) {
    setState(() => _text = count.toString());
  }
}