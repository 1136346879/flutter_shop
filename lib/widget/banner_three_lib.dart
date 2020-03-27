import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../utils/ToastShow.dart' as ToastUtil;

/**
 * banner 模块添加
 */
class BannerLibThree extends StatelessWidget {
  final List bannerList;

  BannerLibThree({Key key,this.bannerList}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Swiper(
        itemCount: bannerList.length,
        itemBuilder: (BuildContext context,int index){
          return Image.network("${bannerList[index]['image']}",fit: BoxFit.fill);
        },
        autoplay: true,
        pagination: new SwiperPagination(),
        onTap: (index){
          ToastUtil.ToastShow().showBottomToast(bannerList[index]['title']);
        },
      ),
    );
  }
}
