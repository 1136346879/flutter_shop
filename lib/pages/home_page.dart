import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController typeController = TextEditingController();
  String showText = '欢迎你来到二元店商城';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("二元店商城"),
        ),
        body: Container(
            height: 1000,
            child: Column(
              children: <Widget>[
                TextField(//  输入框控件
                  controller: typeController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      labelText: '商品类型',
                      helperText: '请输入你需要买的商品'),
                  autofocus: false,
                ),
                RaisedButton(//按钮控件点击 时间
                  onPressed: _choiceAction,
                  child: Text('选择完毕'),
                ),
                Text(
                  showText,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                ),
              ],
            )),
      ),
    );
  }

  void _choiceAction() {
    print('开始选择你喜欢的商品............');
    if (typeController.text.toString() == '') {
      showDialog(//弹框提醒 dialog
          context: context,
          builder: (context) => AlertDialog(title: Text('物品类型不能为空')));
    } else {
      getHttp(typeController.text.toString()).then((val) {
        setState(() {
          showText = val['subjects'].toString();
        });
      });
    }
  }

  /**
   *  获取数据
   */
  Future getHttp(String typeText) async {
    var data = {'count': 20};
    try {
      Response response;
      response = await Dio().get(
          "http://www.liulongbin.top:3005/api/v2/movie/top250?start=0",
          queryParameters: data);
      print("网络数据：  $response.data");
      return response.data;
    } catch (e) {
      return print(e);
    }
  }
}
