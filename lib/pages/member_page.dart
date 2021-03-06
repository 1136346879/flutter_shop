import 'package:flutter/material.dart';

class MemberPage extends StatefulWidget {
  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  List<String> _list = ["C罗","梅西","内马尔","萨拉赫"];
  String  _action = "nothing";
  List<String> _select = [];
  String _choice = "萨拉赫";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child:Column(
              children:<Widget>[
                Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: <Widget>[
                      Chip(
                        label: Text("皮皮"),
                        backgroundColor: Colors.orange,
                        avatar: CircleAvatar(
                          backgroundColor: Colors.green,
                          child: Text("皮"),
                        ),
                      ),
//      SizedBox(width: 20,),
                      Chip(
                        label: Text("会员页面"),
                        backgroundColor: Colors.orange,
                        avatar: CircleAvatar(
                          backgroundColor: Colors.green,
                          child: Text("研"),
                        ),
                      ),
                      Chip(
                        label: Text("王东兴"),
                        backgroundColor: Colors.orange,
                        avatar: CircleAvatar(
                          backgroundImage: NetworkImage("https://goss1.cfp.cn/creative/icon/512/VCG25i1585565.jpg"),
                        ),
                      ),
                      Chip(
                        label: Text("City"),
                        onDeleted: (){},
                        deleteIcon: Icon(Icons.delete_forever),
                        deleteIconColor: Colors.red,
                        deleteButtonTooltipMessage: "remove this chip",
                        backgroundColor: Colors.orange,
                        avatar: CircleAvatar(
                          backgroundImage: NetworkImage("https://goss1.cfp.cn/creative/icon/512/VCG25i1585565.jpg"),
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 2,
                        indent: 28,
                        endIndent: 28,
                      ),
                      Wrap(
                          spacing: 20,
                          children: _list.map((it){
                            return  Chip(
                              label: Text(it),
                              onDeleted: (){
                                setState((){
                                  _list.remove(it);
                                });
                              },
                            );
                          }).toList()
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 2,
                        indent: 28,
                        endIndent: 28,
                      ),
                      Container(
                        width: double.infinity,
                        child: Text("点击的：$_action"),
                      ),
                      Wrap(
                          spacing: 20,
                          children: _list.map((it){
                            return  ActionChip(
                              label: Text(it),
                              onPressed: (){
                                setState((){
                                  _action = it;
                                });
                              },
                            );
                          }).toList()
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 2,
                        indent: 28,
                        endIndent: 28,
                      ),
                      Container(
                        width: double.infinity,
                        child: Text("FilterChip：$_select"),
                      ),
                      Wrap(
                          spacing: 20,
                          children: _list.map((it){
                            return  FilterChip(
                              label: Text(it),
                              selected: _select.contains(it),
                              onSelected: (value){
                                setState((){
                                 if(_select.contains(it)){
                                   _select.remove(it);
                                 }else{
                                   _select.add(it);
                                 }
                                });
                              },
                            );
                          }).toList()
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 2,
                        indent: 28,
                        endIndent: 28,
                      ),
                      Container(
                        width: double.infinity,
                        child: Text("ChoiceChip：$_choice"),
                      ),
                      Wrap(
                          spacing: 20,
                          children: _list.map((it){
                            return  ChoiceChip(
                              label: Text(it),
                              selectedColor: Colors.pink,
                              selected: _choice == it,
                              onSelected: (value){
                                setState((){
                                  _choice = it;
                                });
                              },
                            );
                          }).toList()
                      ),
                    ]
                ),
              ]
          ),

      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restore),
        onPressed: (){
          setState(() {
            _list =["朱穆之","赵志伟","康凡","77"];
            _select=[];
            _choice= "萨拉赫";
          });
        },
      ),
    );
  }
}

