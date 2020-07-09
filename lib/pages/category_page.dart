import 'package:flutter/material.dart';
import '../pages/route/MyHomePage.dart';
import 'provinces_picker.dart';
import '../utils/ToastShow.dart' as ToastUtils;

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();

}
String name ="";
class
//CategoryPage extends StatelessWidget {
_CategoryPageState extends State<CategoryPage>{
  @override
  void initState() {
    super.initState();
   name = "上海市";
  }
  final navKey = GlobalKey<NavigatorState>();


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        navigatorKey: navKey, // 设置navigatorKey
        home: Scaffold(
            appBar: new AppBar(),
//      body: Center(child:Text("商品分类")),
            body: Container(
              child: Column(children: <Widget>[
                new FlatButton(
                  child: new Text("商品分类"),
                  onPressed: () => pushNoContext(),
                ),
                new FlatButton(
                  child: new Text("省市区三级联动"),
                  onPressed: () => showCityPick(context),
                ),
                Text(name)
              ]),
            )));
  }

  pushNoContext() {
    ToastUtils.ToastShow().showBottomToast("点击商品分类");
    //导航到新路由
    navKey.currentState.push(
      MaterialPageRoute(
          // MyHomePage不写参数则默认为1
          builder: (context) => MyHomePage()),
    );


  }
  showCityPick(BuildContext context) {
    String nameString = "";
    ProvincesPicker.showCityPicker(
      context,
      false,//点击弹框外部阴影是否消失
      selectProvince: (province) {
        print(province);
        nameString =  nameString+province["name"];
        ToastUtils.ToastShow().showBottomToast(name);
      },
      selectCity: (city) {
        print(city);
        nameString = nameString+city["name"];
        ToastUtils.ToastShow().showBottomToast(name);
      },
      selectArea: (area) {
        print(area);
        nameString = nameString+area["name"];
        ToastUtils.ToastShow().showBottomToast(name);
        changeUI(nameString);
      },
    );
  }
  changeUI(String nameString) async{
    setState(() {
name  = nameString;
    });
        }

}


