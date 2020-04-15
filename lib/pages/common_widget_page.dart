import 'package:flutter/material.dart';
import 'package:flutter_hexun/pages/route/GlobKeyTestRoute.dart';
import 'route/TestRoute.dart';
import 'package:flutter_hexun/widget/UpgradeDialog.dart';
import 'package:flutter_hexun/config/finalData.dart';
import 'package:flutter_hexun/pages/route/FirstPage.dart';

/**
 *  基础控件列表页
 */
class commonWidgetPage extends StatelessWidget {
  // 接收的num参数
  final int num;
  commonWidgetPage({this.num = 1});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text("基础控件列表"),),
        body: SingleChildScrollView(
          child:  Column(
            children: <Widget>[
              RaisedButton(
                color: Colors.pink,
                onPressed: ()=>   updateAlert(context, mockData), //点击
                child: Text("点击app升级逻辑（ios-Appstore android-下载安装）",style:TextStyle(color: Colors.white)),
              ),
               RaisedButton(
                 color: Colors.pink,
                onPressed: ()=> jumpToPush(context,TestRoute(num: 5)), //点击
                child: Text("普通刷新方式---$num",style:TextStyle(color: Colors.white),),
              ),
              RaisedButton(
                color: Colors.pink,
                onPressed: ()=> jumpToPush(context,GlobKeyTestRoute(num: 6)), //点击
                child: Text("局部刷新优化---$num",style:TextStyle(color: Colors.white),),
              ),
              RaisedButton(
                color: Colors.pink,
                onPressed: ()=> jumpToPush(context,FirstPage()), //点击
                child: Text("路由跳转---$num",style:TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
}

  jumpToPush(BuildContext context, Widget testRoute) {
        /*
   * 路由跳转方法
   * */
    //导航到新路由
    Navigator.push(
      context,
      MaterialPageRoute(
        // num传给下一级
          builder: (context) => testRoute),  //普通刷新方式
    ).then((value){//上一页面点击返回  传递回来的数据
//      if (value != null)
        print('接收到的参数：$value');
    });
  }
}
