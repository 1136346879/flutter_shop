import 'package:flutter/material.dart';
import './BottomNavigationBarPage.dart';
import './BottomTabBarViewPage.dart';
import './BottomAppBarPage.dart';
import './BottomNavigationBarPagetwo.dart';
import './route/FadeRoute.dart';
import 'package:flutter_plugin_record/flutter_plugin_record.dart';

class UIFrameWorkEntrancePage extends StatefulWidget {
  @override
  _UIFrameWorkEntrancePageState createState() =>
      _UIFrameWorkEntrancePageState();
}


class _UIFrameWorkEntrancePageState extends State<UIFrameWorkEntrancePage> {
  //实例化对象
  FlutterPluginRecord   recordPlugin = new FlutterPluginRecord();
  @override
  void initState() {

    super.initState();
//    初始化
//    recordPlugin.init();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(title: Text("UIFrameWork入口")),
        body: new Column(
          children: <Widget>[
            new RaisedButton(
              onPressed: () => push( BottomNavigationBarPage()),
              child: new Text("BottomNavigationBarPage"),
            ),
            new RaisedButton(
              onPressed: () => push( MyHomePage()),
              child: new Text("BottomNavigationBarTwoPage"),
            ),
            new RaisedButton(
              onPressed: () => push( BotomeAppBarPage()),
              child: new Text("BotomeAppBarPage"),
            ),
            new RaisedButton(
              onPressed: () => push( BottomTabBarViewPage()),
              child: new Text("BottomTabBarViewPage"),
            ),
            new RaisedButton(
              onPressed: () => startRecode(),
              child: new Text("startRecode"),
            ),
            new RaisedButton(
              onPressed: () => stopRecode(),
              child: new Text("stopRecode"),
            ),
            new RaisedButton(
              onPressed: () => playRecode(),
              child: new Text("playRecode"),
            ),
          ],
        ));
  }


  void push(Widget bottomNavigationBarPage) {
    /*
   * 路由跳转方法
   * */
    //导航到新路由
    Navigator.push(
        context,
        FadeRoute(page: bottomNavigationBarPage));//页面跳转 渐变动画
//      MaterialPageRoute(// num传给下一级
//          builder: (context) => commonWidgetPage(num: 5)),
//    );
  }

  void startRecode() {
    recordPlugin.start();
  }

  void stopRecode() {
    recordPlugin.stop();
  }

  void playRecode() {
    recordPlugin.play();
  }
}
