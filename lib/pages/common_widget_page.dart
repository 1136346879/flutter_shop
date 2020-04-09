import 'package:flutter/material.dart';
import 'package:flutter_hexun/pages/GlobKeyTestRoute.dart';
import '../pages/TestRoute.dart';

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
                onPressed: ()=> jumpToPush(context,TestRoute(num: 5)), //点击
                child: Text("普通刷新方式---$num",style:TextStyle(color: Colors.white),),
              ),
              RaisedButton(
                color: Colors.pink,
                onPressed: ()=> jumpToPush(context,GlobKeyTestRoute(num: 6)), //点击
                child: Text("局部刷新优化---$num",style:TextStyle(color: Colors.white),),
              )
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
