import 'package:shared_preferences/shared_preferences.dart';

/**
 * 用户信息管理类
 */
class UserTools{
 static UserTools _userToolsInstance;
 static SharedPreferences _sharedPreferences;

Future<UserTools> get instance async{
 return await getInstance();
}

 Future<UserTools>  getInstance() async{
 if(_userToolsInstance == null){
  _userToolsInstance = UserTools();
  await _userToolsInstance.init();
 }
 await _userToolsInstance.init();
 }

  Future init() async{
    _sharedPreferences = await SharedPreferences.getInstance() ;
  }










 }