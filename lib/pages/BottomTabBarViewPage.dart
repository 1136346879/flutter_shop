import 'package:flutter/material.dart';
import 'cart_page.dart';
import 'category_page.dart';
class BottomTabBarViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new BottomTabBarViewPageState();
}

class BottomTabBarViewPageState extends State<BottomTabBarViewPage>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  /// 相当于TabLayout 和 ViewPage
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: new TabBarView(controller: controller, children: <Widget>[
        new CartPage(),
        new CategoryPage(),
        new CartPage(),
      ]),
      bottomNavigationBar:
//      new Material(
//        color: Colors.blue,
//        child:
        new TabBar(
          controller: controller,
          tabs: <Tab>[
            new Tab(text: "首页", icon: new Icon(Icons.home)),
            new Tab(text: "列表", icon: new Icon(Icons.list)),
            new Tab(text: "信息", icon: new Icon(Icons.message)),
          ],
          indicatorWeight: 0.1,
//        ),
      ),
    );
  }
}