import 'dart:math';
import 'package:flutter/material.dart';

/**
 * TabBar & TabBarView
 * 顶部 新闻栏目添加
 */

class TabBarTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TestDemoState();
  }
}

class _TestDemoState extends State<TabBarTest>
    with SingleTickerProviderStateMixin {
  TabController mController;
  List<String> tabTitles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarView(),
      body: _tabBarView(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    mController.dispose();
  }

  @override
  void initState() {
    super.initState();
    tabTitles = [
      "tab1",
      "tab2",
      "tab3",
      "tab4",
      "tab5",
      "tab6",
      "tab7",
      "tab8",
      "tab9",
    ];

    mController = TabController(
      length: tabTitles.length,
      vsync: this,
    );
  }

  Widget _appBarView() {
    return AppBar(
      title: Text("TabBar & TabBarView",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
      elevation: 0,
      bottom: _tabBar(),
    );
  }

  Widget _tabBar() {
    return TabBar(
      //设置tab是否可水平滑动
        isScrollable: true,
        //控制器
        controller: mController,
        //设置tab文字得类型
        labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        //设置tab选中得颜色
        labelColor: Colors.black,
        //设置tab未选中得颜色
        unselectedLabelColor: Colors.black45,
        //设置自定义tab的指示器，CustomUnderlineTabIndicator
        //若不需要自定义，可直接通过
        //indicatorColor 设置指示器颜色
        //indicatorWight 设置指示器厚度
        //indicatorPadding
        //indicatorSize  设置指示器大小计算方式
//        indicator: CustomUnderlineTabIndicator(
//            strokeCap: StrokeCap.round,
//            insets: EdgeInsets.only(left: 15, right: 15),
//            borderSide: BorderSide(width: 4.0, color: Colors.red)),
        tabs: tabTitles.map((item) {
          return Tab(text: item);
        }).toList());
  }

  Widget _tabBarView() {
    return TabBarView(
      controller: mController,
      children: tabTitles.map((item) {
        return Container(
          color: _getColor(),
          child: Center(
            child: Text(item,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        );
      }).toList(),
    );
  }

  Color _getColor() {
    var random = new Random();
    int r = random.nextInt(255);
    int g = random.nextInt(255);
    int b = random.nextInt(255);
    print(r);
    print(g);
    print(b);
    return Color.fromARGB(255, r, g, b);
  }

}