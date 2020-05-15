import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_hexun/entry/widget_info.dart';

///
/// des:
///
class HttpFactory {
  factory HttpFactory() => _getInstance();

  static HttpFactory _instance;

  static const String _host = "http://laomengit.com/";

  Dio _dio;

  HttpFactory._() {
    var options = BaseOptions(
        baseUrl: '$_host', connectTimeout: 5000, receiveTimeout: 3000);
    _dio = Dio(options);
  }

  static _getInstance() {
    if (_instance == null) {
      _instance = HttpFactory._();
    }
    return _instance;
  }

  ///
  /// 获取数据
  ///
  getData() async {
    var response = await _dio.get('flutter_fly_data.json');
    return response.data;
  }

  ///
  /// 获取升级信息
  ///
  getUpgradeInfo() async {
    var response = await _dio.get('flutter_fly_upgrade.json');
    return response.data;
  }
}
