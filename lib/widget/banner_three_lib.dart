import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../utils/ToastShow.dart' as ToastUtil;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../pages/route/MyHomePage.dart';
import '../pages/BottomAppBarPage.dart';

/**
 * banner 模块添加
 */
class BannerLibThree extends StatelessWidget {
  final List bannerList;
  BannerLibThree({Key key,this.bannerList}):super(key: key);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init( width: 750, height: 1334);
    return  Container(
//      height: 333,
          height: ScreenUtil().setHeight(333),  //px
          width: ScreenUtil().setWidth(750),//px
          child: Swiper(
            itemCount: bannerList.length,
            itemBuilder: (BuildContext context,int index){
              return Image.network("${bannerList[index]['image']}",fit: BoxFit.fill);
            },
            autoplay: true,
            pagination: new SwiperPagination(),
            onTap: (index){
              ToastUtil.ToastShow().showBottomToast(bannerList[index]['title']);
              push(context);
            },
          ),
    );
  }

  void push(BuildContext context) {
    //导航到新路由
    Navigator.push(
      context,
      MaterialPageRoute(
        // MyHomePage不写参数则默认为1
//          builder: (context) => MyHomePage()),
          builder: (context) => BotomeAppBarPage()),
    );
  }


}
