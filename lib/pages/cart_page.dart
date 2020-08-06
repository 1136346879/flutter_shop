import 'package:flutter/material.dart';
import 'package:flutter_hexun/config/app_config.dart';
import 'package:flutter_hexun/pages/user/register.dart';
import 'package:flutter_hexun/pages/user/login.dart';
import 'package:flutter_hexun/utils/ToastShow.dart';
import 'package:flutter_hexun/utils/Usertools.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
   String  name = "";
   @override
  void initState() {
    super.initState();
    name = "购物车--";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(name),
            FloatingActionButton(
              heroTag: 'image0',
              child: const Icon(Icons.add_shopping_cart),
              onPressed: () {
                _jumpLogin();
              },
            ),
            FloatingActionButton(
              heroTag: 'image1',
              child: const Icon(Icons.verified_user),
              onPressed: () {
               _showUserInfo();
              },
            ),
          ],
        ),
      ),
    );
  }

  _showUserInfo() {
    AppConfig.userTools.getUserData();
  }

  void _jumpLogin() async{
    var userName= await Navigator.push(
        context,
        MaterialPageRoute(
          // num传给下一级
          builder: (context) => Login(usernameLogin:"",passwordLogin:""),
        ));
    print("用户名：  $userName");
    setState(() {
      name = userName as String;
    });
  }
}

//class CartPage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Center(child:Text("购物车")),
//    );
//  }
//}
