import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hexun/config/finalData.dart';
import 'package:flutter_hexun/pages/home_two.dart';
import 'package:flutter_hexun/widget/UpgradeDialog.dart';
import 'home_page.dart';
import 'category_page.dart';
import 'MyHomePage.dart';
import 'cart_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_hexun/pages/meizi.dart';
import 'package:flutter_hexun/pages/account.dart';
import 'package:flutter_hexun/pages/category.dart';
import 'package:flutter_hexun/pages/home_two.dart';
import 'record/SecondScreen.dart';
import 'record/OverLayScreen.dart';
import 'barrage/barrage_main_page.dart';
import 'subtitle/subtitle_page_main.dart';

import 'member_page.dart';

/**
 * 首页BottomNavigationBar  页面来回切换
 */
class BottomNavigationBarPage extends StatefulWidget {
  //动态切换页面 用 StatefulWidget
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<BottomNavigationBarPage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text("首页")),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search), title: Text("分类")),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.shopping_cart), title: Text("购物车")),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.book), title: Text("会员")),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.bus), title: Text("主页")),
  ];

//  final List<Widget> pageList = [HomePage(), CategoryPage(), CartPage(), MemberPage(),MyHomePage()];
//  final List<Widget> pageList = [HomePage(), CategoryPage(), CartPage(), MemberPage(),barrage_main_page()];
  final List<Widget> pageList = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage(),
    subtitle_page_main()
  ];

//  final List<Widget> pageList = [HomePage(), SecondScreen(), OverLayScreen(), MemberPage(),MyHomePage()];
//  final List<Widget> pageList = [HomePage(), Category(),MeiZiPage (), HomeTwoPage(),AccountPage()];

  int currentIndex = 0;
  var currentPage;

//  @override
//  void initState() {
//    currentPage = pageList[currentIndex];
//    super.initState();
//  }
  PageController _pageController;

  void initState() {
    super.initState();
    this._pageController = new PageController(initialPage: this.currentIndex);
//      updateAlert(context, mockData);//升级框
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    return Scaffold(
//      backgroundColor: Color.fromRGBO(245, 245, 245, 1.0),//北京
      backgroundColor: Color(0xffffa200),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, //类型
        items: bottomTabs, //底部tab
        currentIndex: currentIndex, //当前 index
        onTap: (index) {
          //点击后调用 setState 方法  然后会重新绘制页面
          setState(() {
            currentIndex = index; //点击的tab
            currentPage = pageList[currentIndex]; //当前页面
            this._pageController.jumpToPage(this.currentIndex);
          });
        },
      ),
//第一种  IndexedStack  IndexedStack继承自Stack，它的作用是显示第index个child，其它child在页面上是不可见的，但所有child的状态都被保持，所以这个Widget可以实现我们的需求，我们只需要将现在的body用IndexedStack包裹一层即可
//      body: IndexedStack( //IndexedStack或者pageview
//        index: currentIndex,
//        children: pageList,
//      )

      //第二种 Offstage的作用十分简单，通过一个参数来控制child是否显示，所以我们同样可以组合使用Offstage来实现该需求，其实现原理与IndexedStack类似
//      body: Stack(
//        children: [
//          Offstage(
//            offstage: currentIndex != 0,
//            child: bodyList[0],
//          ),
//          Offstage(
//            offstage: currentIndex != 1,
//            child: bodyList[1],
//          ),
//          Offstage(
//            offstage: currentIndex != 2,
//            child: bodyList[2],
//          ),
//        ],
//      )
      /**
       * 在上面的两种方式中都可以实现保持原页面状态的需求，但这里有一些开销上的问题，有经验的小伙伴应该能发现当应用第一次加载的时候，所有子页状态都被实例化了（>这里的细节并不是因为我直接把子页实例化放在bodyList里...<），如果在子页State的initState中打印日志，可以在终端看到一次性输出了所有子页的日志。下面就介绍另一种通过继承AutomaticKeepAliveClientMixin的方式来更好的实现保持状态。
       *
       * 现在已经可以看到，不管是切换底部导航还是切换首页顶部导航，所有的页面状态都可以被保持，并且在应用第一次加载时，终端只看到recommend initState的日志，第一次切换首页顶部导航至vip页面时，终端输出vip initState，当再次返回推荐页时，不再输出recommend initState。
          所以，使用TabBarView+AutomaticKeepAliveClientMixin这种方式既实现了页面状态的保持，又具有类似惰性求值的功能，对于未使用的页面状态不会进行实例化，减小了应用初始化时的开销。
       */
      //第三种 PageView  前面在底部导航介绍了使用IndexedStack和Offstage两种方式实现保持页面状态，但它们的缺点在于第一次加载时便实例化了所有的子页面State。为了进一步优化
      // ，应用第一次加载时不会输出second initState，仅当第一次点击底部导航切换至该页时，该子页的State被实例化。
      body: PageView(
        //修改的部分：
        controller: this._pageController,
        children: this.pageList,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index; //点击的tab
          });
        },
      ),
//      body: currentPage,//主体显示的是当前的页面
    );
  }
}
