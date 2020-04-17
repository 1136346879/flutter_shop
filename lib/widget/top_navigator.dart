import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_hexun/utils/ToastShow.dart' as ToastUtils;
import '../pages/TabBarTest.dart';
import '../pages/AppOne.dart';

class TopNavigator extends StatelessWidget {
  final List navigatorList;

  TopNavigator({Key key, this.navigatorList}) : super(key: key);

  Widget _gridViewItemUi(BuildContext context, item) {
    return InkWell(
      onTap: () => {
//        _press(item);
        push(context)
      },
      child: Column(
        children: <Widget>[
          Image.network(
            item['image'],
            width: ScreenUtil().setWidth(80),
            height: ScreenUtil().setHeight(80),
          ),
          Text(item['name'])
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(250),
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
        crossAxisCount: 5,
        padding: EdgeInsets.all(3.0),
        children: navigatorList.map((item) {
          return _gridViewItemUi(context, item);
        }).toList(),
      ),
    );
  }

  _press(item) {
    ToastUtils.ToastShow().showBottomToast(item['name']);
  }

  void push(BuildContext context) {
    //导航到新路由
    Navigator.push(
      context,
      MaterialPageRoute(
        // MyHomePage不写参数则默认为1
//          builder: (context) => MyHomePage()),
//          builder: (context) => TabBarTest()),
          builder: (context) => AppOne()),
    );
  }
}
