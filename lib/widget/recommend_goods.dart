import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_hexun/utils/ToastShow.dart' as ToastUtils;
class recommendGoods extends StatelessWidget {

  final List recommendList;
  recommendGoods({Key key,this.recommendList}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(480),
      child: Column(
        children: <Widget>[
          _today_recommend(),
          _recommenr_list(),
        ],
      ),
    );
  }

  Widget _today_recommend() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border(bottom: BorderSide(width: 0.5, color: Colors.black12))),
      child: Text(
        '今日推荐',
        style: new TextStyle(
          color: Colors.pink,
          fontSize: 24,
        ),
      ),
    );
  }

  Widget _recommenr_list() {
    return Container(
      height: ScreenUtil().setHeight(300),
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border:
            Border(bottom: BorderSide(width: 0.5, color: Colors.black12))),
      child:ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: recommendList.length,
          itemBuilder: (context, index){
            return _item(index);
          })
//      child: Column(
//        children: <Widget>[
//          Text('商品推荐列表'),
//        ],
//      ),
    );
  }

  Widget _item(int index) {
    return Container(
      padding: EdgeInsets.all(10),
      child:InkWell(
        onTap: () => {_press(recommendList[index])},
        child: Column(
          children: <Widget>[
            Image.network(
              recommendList[index]['image'],
              width: ScreenUtil().setWidth(80),
              height: ScreenUtil().setHeight(80),
            ),
            Text(recommendList[index]['name'])
          ],
        ),
      ) ,
    );
  }
  _press(item) {
    ToastUtils.ToastShow().showBottomToast(item['name']);
  }
}
