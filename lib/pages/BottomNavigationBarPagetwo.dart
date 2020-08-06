import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hexun/pages/about.dart';
import 'package:flutter_hexun/pages/account.dart';
import 'package:flutter_hexun/pages/category.dart';
import 'package:flutter_hexun/pages/home_two.dart';
import 'package:flutter_hexun/pages/meizi.dart';
import 'package:flutter_hexun/pages/other_gank.dart';
import '../icons/iconfont.dart';

//void main() {
//  runApp(MyApp());
//
//  if (Platform.isAndroid) {
//    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
//      statusBarColor: Colors.transparent,
//    );
//    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
//
//    print("systemUiOverlayStyle");
//  }
//}

class BottomNavigationBarTwoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/",
      theme: ThemeData(primarySwatch: Colors.green, primaryColor: Colors.white),//设置App主题
      routes: {
        "/":(context)=>MyHomePage(),
        "/about":(context)=>About(),
        "/other":(context)=>OtherGank(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  var _pageController = PageController(initialPage: 0);

  void _incrementCounter() {
    setState(() {
      _selectedIndex++;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_pageController.hasClients) {
//      _pageController.animateToPage(_selectedIndex,
//          duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      _pageController.jumpToPage(_selectedIndex);
    }
  }

  void _onPageChange(int index) {
    print("_onPageChange");
    setState(() {
      _selectedIndex = index;
    });
  }

  StatefulWidget _getPageByIndex(int index) {
    switch (index) {
      case 0:
        return HomeTwoPage();
      case 1:
        return Category();
      case 2:
        return MeiZiPage();
      case 3:
        return AccountPage();
      default:
        return HomeTwoPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemBuilder: (context, index) {
          return Center(
            child: _getPageByIndex(index),  //每个页面展示的组件
          );
        },
        itemCount: 4, //页面数量
        onPageChanged: _onPageChange, //页面切换
        controller: _pageController, //控制器
        physics: NeverScrollableScrollPhysics(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: new Icon(Icons.home), title: new Text("首页")),
          BottomNavigationBarItem(
              icon: new Icon(Icons.category), title: new Text("分类")),
          BottomNavigationBarItem(
              icon: new Icon(Icons.pregnant_woman), title: new Text("妹子")),
          BottomNavigationBarItem(
              icon: new Icon(Icons.assignment_ind), title: new Text("我的")),
        ],
        selectedItemColor: Color(0xFF4CAF50),//选中
        unselectedItemColor: Color(0xff666666),//未选中
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        selectedFontSize: 12.0,
      ),
    );
  }
}
