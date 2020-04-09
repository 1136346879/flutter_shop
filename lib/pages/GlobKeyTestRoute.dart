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
  // 接收的num参数
  final int num;
  // MyHomePage不写参数则默认为1
  GlobKeyTestRoute({this.num = 1});
  @override
  _TestRouteState createState() => _TestRouteState();
}

class _TestRouteState extends State<GlobKeyTestRoute> {
  int count = 0;

  GlobalKey<TextWidgetState> textKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(//导航返回拦截WillPopScope
        child:new Scaffold(
        appBar: AppBar(title: Text("局部刷新优化"),),
    body:new Column(
//      mainAxisAlignment: MainAxisAlignment.center,//居中
      children: <Widget>[
//        new Spacer(flex: 1),//空白展示
        new TextWidget(textKey), //需要更新的Text
        new FlatButton(
          color: Colors.amberAccent,
          onPressed: () {
            count++; // 这里我们只给他值变动，状态刷新交给下面的Key事件
            textKey.currentState.onPressed(count);
          },
          child: new Text('按钮 ${widget.num}' ,style: TextStyle(color: Colors.black,fontSize: 25,),),
        ),
        new RaisedButton(
          onPressed: () => Navigator.pop(context, "我是返回值--局部优化刷新"),
          child: new Text("返回"),
        ),
      ],
    )),
      onWillPop: () {
          _requestPop();
          },);
  }

  Future<bool> _requestPop() {
    _showDialog();
    return new Future.value(false);
  }

  _showDialog() {
    showDialog<Null>(
      context: context,
      child: new AlertDialog(content: new Text('退出当前界面'), actions: <Widget>[
        new FlatButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.of(context).pop();
//              Navigator.pop(context, "我是返回值--局部优化刷新");
            },
            child: new Text('确定'))
      ]),
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
    return new Text(_text,
        style: TextStyle(color: Colors.black,fontSize: 25,),);
  }

  void onPressed(int count) {
    setState(() => _text = count.toString());
  }
}