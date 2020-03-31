import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_hexun/utils/ToastShow.dart' as ToastUtils;

class TopNavigator extends StatelessWidget {
  final List navigatorList;

  TopNavigator({Key key, this.navigatorList}) : super(key: key);

  Widget _gridViewItemUi(BuildContext context, item) {
    return InkWell(
      onTap: () => {_press(item)},
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
}
