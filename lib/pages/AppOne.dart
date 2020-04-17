import 'package:flutter/material.dart';
import 'cart_page.dart';
import 'category_page.dart';
class AppOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new MaterialApp(home: MyHomePage());
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MyHomePageState();
}

class MyHomePageState extends State<MyHomePage>
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
    return new Scaffold(
      body: new TabBarView(controller: controller, children: <Widget>[
        new CartPage(),
        new CategoryPage(),
        new CartPage(),
//        new MyHomePage()
      ]),
      bottomNavigationBar: new Material(
        color: Colors.blue,
        child: new TabBar(
          controller: controller,
          tabs: <Tab>[
            new Tab(text: "首页", icon: new Icon(Icons.home)),
            new Tab(text: "列表", icon: new Icon(Icons.list)),
            new Tab(text: "信息", icon: new Icon(Icons.message)),
          ],
          indicatorWeight: 0.1,
        ),
      ),
    );
  }
}