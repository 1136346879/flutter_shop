import 'package:flutter/material.dart';
import 'fly_home_page.dart';
import 'about_page.dart';
import 'browse_page.dart';
import 'collections_page.dart';
import 'my_detail_page.dart';
import 'welcome_page.dart';

///
/// des: 路由配置
///
class Routes {
//  static const String welcome_page = '/';
  static const String home_page = 'home';
  static const String about_page = 'about';
  static const String collections_page = 'collections';
  static const String browse_page = 'browse';
  static const String my_detail_page = 'my_detail';

  static Map<String, WidgetBuilder> routes = {
//    welcome_page: (context) => WelcomePage(),
    home_page: (context) => FlyHomePage(),
    about_page: (context) => AboutPage(),
    collections_page: (context) => CollectionsPage(),
    browse_page: (context) => BrowsePage(),
    my_detail_page: (context) => MyDetailPage(),
  };
}
