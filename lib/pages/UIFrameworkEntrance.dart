import 'package:flutter/material.dart';
import './BottomNavigationBarPage.dart';
import './BottomTabBarViewPage.dart';
import './BottomAppBarPage.dart';
import './BottomNavigationBarPagetwo.dart';
import './route/FadeRoute.dart';
import '../pages/image_picker_page.dart';
import 'fly/fly_home_page.dart';
import 'record/SecondScreen.dart';
import 'record/OverLayScreen.dart';
/**
 * 首页--各个模块入口
 */
class UIFrameWorkEntrancePage extends StatefulWidget {
  @override
  _UIFrameWorkEntrancePageState createState() =>
      _UIFrameWorkEntrancePageState();
}


class _UIFrameWorkEntrancePageState extends State<UIFrameWorkEntrancePage> {
  @override
  void initState() {
    super.initState();
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
              onPressed: () => push(MyHomePage()),
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
              onPressed: () => push(FlyHomePage()),
              child: new Text("FlyHomePage"),
            ),
            new RaisedButton(
              onPressed: () => push(imagePickerPage()),
              child: new Text("image_picker_location"),
            ),
            new RaisedButton(
              onPressed: () => push(SecondScreen()),
              child: new Text("record——page"),
            ),  new RaisedButton(
              onPressed: () => push(OverLayScreen()),
              child: new Text("OverLay_record——page"),
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
}
