import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class LeaderPhone extends StatelessWidget {
  final String leaderImage;
  final String leaderPhone;
  LeaderPhone({Key key,this.leaderImage,this.leaderPhone}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        child:InkWell(
      onTap: (){LcallPhone();},
      child: Image.network(leaderImage,width: ScreenUtil().setWidth(100)),
    ));
  }

  void LcallPhone() async{

    String  tel = "tel:"+leaderPhone;
    if(await canLaunch(tel)){
    await launch(tel);
    }else{
      throw 'Could not launch $leaderPhone';
    }
  }
}
