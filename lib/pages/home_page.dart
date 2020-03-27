import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_hexun/service/service_method.dart';
import 'package:flutter_hexun/widget/banner_three_lib.dart';
import 'package:flutter_hexun/config/finalData.dart';

/**
 *
 */
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String showText = '还没有返回数据';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text("请求远程数据"),),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              BannerLibThree(bannerList:arr),
              RaisedButton(
                onPressed: _jike,
                child: Text("请求数据"),
              ),
              Text(showText),
            ],
          ),
        ),
      ),
    );
  }

  void _jike() {
//    print("开始请求数据");
//    getHttp().then((val) {
//      setState(() {
//        showText = val['data'].toString();
//      });
//    });
    getHomePageContent();
  }
}

const httpHeaders={
'Accept': 'application/json, text/plain, */*',
'Accept-Encoding': 'gzip, deflate, br',
'Accept-Language': 'zh-CN,zh;q=0.9',
'Connection': 'keep-alive',
'Content-Type': 'application/json',
'Cookie': 'gksskpitn=271fdf14-a193-428b-a074-5192a6ac06b6; _ga=GA1.2.427278503.1583794485; Hm_lvt_022f847c4e3acd44d4a2481d9187f1e6=1583794485; GRID=daa7d2a-e525206-19a1c14-b579ad5; _gid=GA1.2.1058697568.1585190883; SERVERID=1fa1f330efedec1559b3abbcb6e30f50|1585191063|1585190920; _gat=1; Hm_lpvt_022f847c4e3acd44d4a2481d9187f1e6=1585191025',
'Host': 'time.geekbang.org',
'Origin': 'https://time.geekbang.org',
'Referer': 'https://time.geekbang.org/',
'Sec-Fetch-Dest': 'empty',
'Sec-Fetch-Mode': 'cors',
'Sec-Fetch-Site': 'same-origin',
'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36'
//  'Accept': 'application/json, text/plain, */*',
//  'Accept-Encoding': 'gzip, deflate, br',
//  'Accept-Language': 'zh-CN,zh;q=0.9',
//  'Connection': 'keep-alive',
//  'Content-Type': 'application/json',
//  'Cookie': '_ga=GA1.2.676402787.1548321037; GCID=9d149c5-11cb3b3-80ad198-04b551d; _gid=GA1.2.359074521.1550799897; _gat=1; Hm_lvt_022f847c4e3acd44d4a2481d9187f1e6=1550106367,1550115714,1550123110,1550799897; SERVERID=1fa1f330efedec1559b3abbcb6e30f50|1550799909|1550799898; Hm_lpvt_022f847c4e3acd44d4a2481d9187f1e6=1550799907',
//  'Host': 'time.geekbang.org',
//  'Origin': 'https://time.geekbang.org',
//  'Referer': 'https://time.geekbang.org/',
//  'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36'
};
Future getHttp() async {
  try {

    Response response;
    Dio dio = Dio();
    dio.options.headers= httpHeaders;
//    response = await dio.get("https://time.geekbang.org/serv/v1/column/newAll");
    response = await dio.post("https://time.geekbang.org/serv/v3/lecture/list");
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
