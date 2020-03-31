import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'category_page.dart';
import 'cart_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'member_page.dart';

class IndexPage extends StatefulWidget {//动态切换页面 用 StatefulWidget
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text("首页")),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.search), title: Text("分类")),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.shopping_cart), title: Text("购物车")),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.book), title: Text("会员")),
  ];

  final List pageList = [HomePage(), CategoryPage(), CartPage(), MemberPage()];

  int currentIndex = 0;
  var currentPage;
  @override
  void initState() {
    currentPage = pageList[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    return Scaffold(
//      backgroundColor: Color.fromRGBO(245, 245, 245, 1.0),//北京
      backgroundColor: Color(0xffffa200),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,//类型
        items: bottomTabs,//底部tab
        currentIndex: currentIndex,//当前 index
        onTap: (index) {//点击后调用 setState 方法  然后会重新绘制页面
          setState(() {
            currentIndex = index;//点击的tab
            currentPage = pageList[currentIndex];//当前页面
          });
        },
      ),
      body: currentPage,//主体显示的是当前的页面
    );
  }
}
