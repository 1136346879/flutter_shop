import 'package:flutter/material.dart';
import 'package:flutter_hexun/db/browse_db.dart';
import 'custom_web_view.dart';

///
/// des:浏览
///

class BrowsePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BrowsePageState();
}

class _BrowsePageState extends State<BrowsePage> {
  List<Map<String, dynamic>> _list = [];

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  _loadData() async {
    await BrowseDb().initDb();
    _list = await BrowseDb().findAll();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('浏览记录'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${_list[index]['title']}'),
              onTap: () {
                toWebView(context, _list[index]['title'], _list[index]['url']);
              },
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              height: 1,
            );
          },
          itemCount: _list.length),
    );
  }
}
