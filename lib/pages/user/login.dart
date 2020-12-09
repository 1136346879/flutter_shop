import 'package:flutter/material.dart';
import 'package:flutter_hexun/config/app_config.dart';
import 'package:flutter_hexun/utils/Usertools.dart';
import 'package:leancloud_storage/leancloud.dart';
import 'package:flutter_hexun/utils/ToastShow.dart';

/**
 *   login页面
 */
class Login extends StatelessWidget {
  final String usernameLogin;
  final String passwordLogin;
  Login({Key key, this.usernameLogin, this.passwordLogin,}):super(key: key);

  @override
  Widget build(BuildContext context) {
    AppConfig.init();
    return Scaffold(
      appBar: AppBar(
        title: Text('登录页面'),
        elevation: 0.0,
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Colors.black,
        ),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LoginForm(usernameL:usernameLogin,passwordL:passwordLogin),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
   String usernameL;
   String passwordL;
  LoginForm({ this.usernameL, this.passwordL,}):super();
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<LoginForm> {
  final registerFormKey = GlobalKey<FormState>();
  final userNameCtrl = TextEditingController(text:'');
  final userPadCtrl = TextEditingController(text:'');
  var username ,password ;
  bool autovalidate = false;
  void submitRegisterForm() {
    FocusScope.of(context).requestFocus(FocusNode());//关闭键盘
    if (registerFormKey.currentState.validate()) {
      registerFormKey.currentState.save();
      debugPrint('username: $username');
      debugPrint('password: $password');
      var userInfoLogin = _login();
      userInfoLogin.then((it){
        if(it != null)
        ToastShow().showTopToast('${it.username}--登录： sucess');
        Map<String, dynamic> map =  <String,dynamic>{"username":username,"password":password};
        AppConfig.userTools.setUserData(map)
            .then((bool){
          ToastShow().showShortToast("用户信息存储 $bool");
          Navigator.pop(context,it.username);
        });
      });
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Logining...'),
      ));
    } else {
      setState(() {
        autovalidate = true;
      });
    }
  }

  String validateUsername(value) {
    if (value.isEmpty) {
      return 'Username is required.';
    }
    return null;
  }

  String validatePassword(value) {
    if (value.isEmpty || value.toString().length < 6) {
      return '密码不能少于6位';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: userNameCtrl,
            decoration: InputDecoration(
              labelText: 'Username',
              helperText: '请输入用户名',
            ),
            onSaved: (value) {
              username = value;
            },
            initialValue:  widget.usernameL,
            validator: validateUsername,
            autovalidate: autovalidate,
          ),
          TextFormField(
            controller: userPadCtrl,
            obscureText: true,
            //隐藏文字
            decoration: InputDecoration(
              labelText: 'Password',
              helperText: '请输入密码',
            ),
            onSaved: (value) {
              password = value;
            },
            initialValue: widget.passwordL,
            validator: validatePassword,
            //提示
            autovalidate: autovalidate,
          ),
          SizedBox(
            height: 32.0,
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Theme.of(context).accentColor,
              child: Text('登录', style: TextStyle(color: Colors.white)),
              elevation: 0.0,
              onPressed: submitRegisterForm,
            ),
          ),
        ],
      ),
    );
  }

  Future<LCUser> _login() async{
    try {
      // 登录成功
//      LCUser user = await LCUser.login('$username', '$password');
      LCUser user = await LCUser.login('${userNameCtrl.text.trim()}.', '${userPadCtrl.text.trim()}');
      return user;
    } on LCException catch (e) {
      // 登录失败（可能是密码错误）
      print('${e.code} : ${e.message}');
    }
  }
}
