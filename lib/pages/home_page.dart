import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_hexun/service/service_method.dart';
import 'package:flutter_hexun/widget/banner_three_lib.dart';
import 'package:flutter_hexun/config/finalData.dart';
import 'package:flutter_hexun/config/device_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_hexun/widget/top_navigator.dart';
import 'package:flutter_hexun/widget/ad_banner.dart';
import 'package:flutter_hexun/widget/LeaderPhone.dart';
import 'package:flutter_hexun/widget/recommend_goods.dart';
import 'common_widget_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  String showText = '还没有返回数据';
  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("二元店+"),
      ),
      body: FutureBuilder(
          future: getHttp(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (navigatorList.length > 10) {
                navigatorList.removeRange(10, navigatorList.length);
              }
              return SingleChildScrollView(
                  child: Column(
                children: <Widget>[
                  BannerLibThree(bannerList: arr),
                  //三方库展示banner
                  TopNavigator(navigatorList: navigatorList),
                  new Theme(
                    // 通过new ThemeData()创建一个实例并将其传递给Theme Widget
                      data: new ThemeData(
                        buttonColor: Colors.yellow,
                      ),
                      child: RaisedButton(
                        onPressed: _jike, //点击
                        child: Text("请求数据--跳转至基础控件页面"),
                      )
                  ),
                  //gridView 展示 入口
                  AdBanner(adPictureUrls: adPictureUrl),
                  //广告banner
                  LeaderPhone(
                      leaderImage: leaderImage, leaderPhone: leaderPhone),
//                    new Spacer(flex: 1),//空白展示
                  //Spacer设置在未知宽高的Row或者Column会无效或者报错，如果有设宽高就可以无需设置mainAxisAlignment就能实现 我们想要的各种效果了，当然，在Row或者Column里使用Expanded包裹我们的组件也是上级的Row或者Column一定要有宽高， 否则会报错，可滑动组件内不能直接放Expanded，例如："ListView里放Expanded"，具体大家可以自己去尝试。
                  recommendGoods(recommendList: navigatorList),
                  //今日推荐

                  Text(snapshot.data['code'].toString()),
//                  //接口返回数据 直接展示
//                  Text("屏幕宽度--${winWidth(context)}"),
//                  Text("屏幕高度--${winHeight(context)}"),
//                  Text("屏幕密度--${winMd(context)}"),
//                  Text('设备宽度:${ScreenUtil.screenWidth}'),
//                  Text('设备高度:${ScreenUtil.screenHeight}'),
//                  Text('设备像素密度:${ScreenUtil.pixelRatio}'),
                ],
              ));
            } else {
              return Center(
                child: Text('加载中。。。'),
              );
            }
          }),
    );
  }

  void _jike() {
//    print("开始请求数据");
    getHttp().then((val) {
      setState(() {
        showText = val['code'].toString();
      });
    });

    push();
//    getHomePageContent();
  }

  @override
  bool get wantKeepAlive => true;

  void push() {
    /*
   * 路由跳转方法
   * */
    //导航到新路由
    Navigator.push(
      context,
      MaterialPageRoute(
        // num传给下一级
          builder: (context) => commonWidgetPage(num: 5)),
    );
  }
}

const httpHeaders = {
  'Accept': 'application/json, text/plain, */*',
  'Content-Type': 'application/json',
  'Origin': 'https://time.geekbang.org',
  'Cookie':
      '_ga=GA1.2.2031756187.1585190618; _gid=GA1.2.472134053.1585290913; Hm_lpvt_022f847c4e3acd44d4a2481d9187f1e6=1585290938; Hm_lvt_022f847c4e3acd44d4a2481d9187f1e6=1585190618; SERVERID=3431a294a18c59fc8f5805662e2bd51e|1585290985|1585290959; _gat=1; GRID=11ce355-72dbc42-ee2f36b-eed09e8; gksskpitn=8c114217-2103-4ffe-981d-696eef26460e',
  'Accept-Language': 'zh-cn',
  'Host': 'time.geekbang.org',
  'User-Agent':
      'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.5 Safari/605.1.15',
  'Referer': 'https://time.geekbang.org/',
  'Accept-Encoding': 'gzip, deflate, br',
  'Connection': 'keep-alive'
};

Future getHttp() async {
  try {
    Response response;
    Dio dio = new Dio();
    dio.options.headers = httpHeaders;
    response = await dio.post("https://time.geekbang.org/serv/v2/explore/list");
    print("即可数据---" + response.toString());
    return response.data;
  } catch (e) {
    return print(e);
  }
}

//
//class HomePage extends StatefulWidget {
//  @override
//  _HomePageState createState() => _HomePageState();
//}
//
//class _HomePageState extends State<HomePage> {
//  TextEditingController typeController = TextEditingController();
//  String showText = '欢迎你来到二元店商城';
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: Scaffold(
//        appBar: AppBar(
//          title: Text("二元店商城"),
//        ),
//        body:SingleChildScrollView(
//          child:   Container(
////              height: 1000,
//              child: Column(
//                children: <Widget>[
//                  TextField(//  输入框控件
//                    controller: typeController,
//                    decoration: InputDecoration(
//                        contentPadding: EdgeInsets.all(10.0),
//                        labelText: '商品类型',
//                        helperText: '请输入你需要买的商品'),
//                    autofocus: false,
//                  ),
//                  RaisedButton(//按钮控件点击 时间
//                    onPressed: _choiceAction,
//                    child: Text('选择完毕'),
//                  ),
//                  Text(
//                    showText,
//                    overflow: TextOverflow.ellipsis,
//                    maxLines: 5,
//                  ),
//                ],
//              )),
//        )
//      ),
//    );
//  }
//
//  void _choiceAction() {
//    print('开始选择你喜欢的商品............');
//    if (typeController.text.toString() == '') {
//      showDialog(//弹框提醒 dialog
//          context: context,
//          builder: (context) => AlertDialog(title: Text('物品类型不能为空')));
//    } else {
//      getHttp(typeController.text.toString()).then((val) {
//        setState(() {
//          showText = val['subjects'].toString();
//        });
//      });
//    }
//  }
//
//  /**
//   *  获取数据
//   */
//  Future getHttp(String typeText) async {
//    var data = {'count': 20};
//    try {
//      Response response;
//      response = await Dio().get(
//          "http://www.liulongbin.top:3005/api/v2/movie/top250?start=0",
//          queryParameters: data);
//      print("网络数据：  $response.data");
//      return response.data;
//    } catch (e) {
//      return print(e);
//    }
//  }
//}
