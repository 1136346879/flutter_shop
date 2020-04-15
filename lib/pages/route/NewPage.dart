import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  final String text;

  NewPage({
    @required this.text, // 接收一个text参数
  });

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("新页面：$text")),
      body: new RaisedButton(
        onPressed: () => Navigator.pushNamed(context, "towPage"),
        child: new Text("到第二个页面"),
      ),
    );
  }
}