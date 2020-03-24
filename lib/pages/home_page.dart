import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getHttp();
    return Scaffold(
      body: Center(child: Text("商城首页")),
    );
  }

  void getHttp() async {
    try {
      Response response;
      response = await Dio().get(
          "http://www.liulongbin.top:3005/api/v2/movie/top250?start=0&count=20",);
     return print("网络数据：  $response");
    } catch (e) {
      return print(e);
    }
  }
}

