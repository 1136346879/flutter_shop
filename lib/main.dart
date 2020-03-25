import 'package:flutter/material.dart';
import './pages/index_page.dart';

void main() {runApp(MyApp());}
//void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: "二元店+",
        debugShowCheckedModeBanner: false,
        theme:ThemeData(
          primaryColor:Color(0xffffa200)
        ),
          home:IndexPage()
      ),
    );
  }
}
