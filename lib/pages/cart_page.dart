import 'package:flutter/material.dart';
import 'package:flutter_hexun/pages/user/register.dart';
import 'package:flutter_hexun/pages/user/login.dart';
import 'package:flutter_hexun/utils/ToastShow.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("购物车--"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("购物车--"),
            FloatingActionButton(
              child: const Icon(Icons.add_shopping_cart),
              onPressed: () {
                Navigator.push(
                    context,
                MaterialPageRoute(
                  // num传给下一级
                  builder: (context) => Register(),
                ));
              },
            )
          ],
        ),
      ),
    );
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
