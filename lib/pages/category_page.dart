import 'package:flutter/material.dart';
import '../pages/route/MyHomePage.dart';
import 'provinces_picker.dart';
import '../utils/ToastShow.dart' as ToastUtils;
import 'package:leancloud_storage/leancloud.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

String name = "";

class //CategoryPage extends StatelessWidget {
    _CategoryPageState extends State<CategoryPage> {

  //组件内部数据传递  状态管理
  ValueNotifier<String> _valueNotifier = new ValueNotifier("请点击上方选择城市区域");//

  @override
  void initState() {
    super.initState();
    name = "上海市";
    _valueNotifier.addListener(update);
  }

  final navKey = GlobalKey<NavigatorState>();

  void update() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _valueNotifier.removeListener(update);
  }

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
                Text(_valueNotifier.value.toString())
              ]),
            )));
  }

  pushNoContext() {
    ToastUtils.ToastShow().showBottomToast("点击商品分类");
//    //导航到新路由
//    navKey.currentState.push(
//      MaterialPageRoute(
//          // MyHomePage不写参数则默认为1
//          builder: (context) => MyHomePage()),
//    );
  _saveData();
  }
  var todo =new LCObject("Todo");

  _saveData() async{
    // 构建对象
// 为属性赋值
    todo["title"] = "工程师周会";
    todo["content"] = "周二两点，全体成员222";
// 将对象保存到云端
    await todo.save();
  }

  showCityPick(BuildContext context) {
    String nameString = "";
    ProvincesPicker.showCityPicker(
      context,
      false, //点击弹框外部阴影是否消失
      selectProvince: (province) {
        print(province);
        nameString = nameString + province["name"];
//        ToastUtils.ToastShow().showBottomToast(name);
      },
      selectCity: (city) {
        print(city);
        nameString = nameString + city["name"];
//        ToastUtils.ToastShow().showBottomToast(name);
      },
      selectArea: (area) {
        print(area);
        nameString = nameString + area["name"];
        ToastUtils.ToastShow().showBottomToast(nameString);
        _valueNotifier.value = nameString;
//        changeUI(nameString);
      },
    );
  }

  changeUI(String nameString) async {
    setState(() {
      name = nameString;
    });
  }
}
