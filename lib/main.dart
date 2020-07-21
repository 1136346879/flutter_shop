import 'package:flutter/material.dart';
import './pages/BottomNavigationBarPage.dart';
import './pages/BottomTabBarViewPage.dart';
import './pages/BottomAppBarPage.dart';
import './pages/BottomNavigationBarPagetwo.dart';
import './pages/UIFrameworkEntrance.dart';
import './pages/fly/Routes.dart';
import 'package:leancloud_storage/leancloud.dart';


void main() {
  //  ColorFiltered(colorFilter: ColorFilter.mode(Colors.red, BlendMode.color),child:MyApp());
  runApp(MyApp());

}
//void main() => runApp(MyApp());

/**
 * 实现底部导航栏并点击切换页面可简述为有三种方式
    1,BottomNavigationBar + BottomNavigationBarItem(index_page页面)
    2,自定义 BottomAppBar   使用 BottomAppBar 来实现
    3,TabBar + TabBarView
 */
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    LeanCloud.initialize('i1fg7nB7HgnUo4OBTRdyH9N4-gzGzoHsz', 'ad1JbwGahamdN8WkRBUURls4',
        server: 'https://i1fg7nb7.lc-cn-n1-shared.com',
        queryCache: new LCQueryCache());
    return Container(
      child: MaterialApp(
        title: "二元店+",
        debugShowCheckedModeBanner: false,
        theme:ThemeData(//全局主题
//          primaryColor:Color(0xffffa200)
          brightness: Brightness.light,//应用程序整体主题的亮度。 由按钮等Widget使用，以确定在不使用主色或强调色时要选择的颜色。
          primaryColor: Colors.pink[200],//App主要部分的背景色（ToolBar,Tabbar等）。
          accentColor: Colors.amber[800], //前景色（文本、按钮等）    如下方五个tab按钮
        ),
          routes: Routes.routes,
          home:UIFrameWorkEntrancePage()  //    BottomNavigationBar + BottomNavigationBarItem(index_page页面)  + pageview
//          home:BottomNavigationBarPage()  //    BottomNavigationBar + BottomNavigationBarItem(index_page页面)  + pageview
//          home:BottomNavigationBarTwoPage()  // //    BottomNavigationBar + BottomNavigationBarItem(index_page页面)  + pageview
//          home:BotomeAppBarPage()  //BottomAppBar
//          home:BottomTabBarViewPage()  //   TabBar + TabBarView

      ),
    );
  }
}
