# 路由管理控制
  你能学到的知识点  
  
  路由是一个应用程序抽象的屏幕或页面；
  路由管理就是管理页面之间如何跳转；
  路由入栈指打开一个新页面；
  路由出栈指一个页面关闭操作；
  路由管理指如何来管理路由栈；
  Navigator是一个管理路由的widget；
  NavigatorKey是一个管理路由的Key；
  看完本文你将学会路由的使用、管理好一个路由、路由传参、路由带参返回、 路由记录、返回到指定路由、路由动画， 然后使用pop操作来进行回退到某个路由；

Navigator

方法	作用
pushNamed	按路由名字路由入栈
pushReplacementNamed	按路由名字替换当前路由栈
popAndPushNamed	将当前路线从导航器中弹出，并在其中推入已命名的路由位置
pushNamedAndRemoveUntil	按路由名称将具有给定名称的路由推入导航器，然后删除所有
push	直接路由入栈
pushReplacement	替换当前路由栈
pushAndRemoveUntil	将具有给定名称的路由推入导航器，然后删除所有
replace	用新路由替换导航器上的路由
replaceRouteBelow	用新路由替换导航器上的路由。 路由是替换为给定anchorRoute下面的那个
canPop	导航器是否可以弹出。
maybePop	导航器是否可以弹出，可以的话弹出
pop	弹出路由
popUntil	一直弹出直到指定路由
removeRoute	删除指定路由
removeRouteBelow	立即从导航器中删除一条路由，然后[Route.dispose]的要替换的路线是给定的“ anchorRoute”下方的路线。


![image](https://github.com/1136346879/Image_Assert/blob/master/Flutter%E7%A7%BB%E5%8A%A8%E7%94%B5%E5%95%86%E5%AE%9E%E6%88%98-%E7%9F%A5%E8%AF%86%E7%82%B9%E6%A2%B3%E7%90%86.png)

                   （4）， 路由页面跳转传参 并接受返回参数 Navigator.push( context,
                                                         MaterialPageRoute( // num传给下一级
                                                             builder: (context) => testRoute),  //普通刷新方式
                                                       ).then((value){//上一页面点击返回  传递回来的数据
                                                   //      if (value != null)
                                                           print('接收到的参数：$value'); });

#### 路由命名

我们想执行跟name有关的Navigator方法就必须先给路由命名，比如pushNamed方法, 注册路由在MaterialApp的routes属性，

newPage就注册好了，然后试试pushNamed方法：

/*
 * 路由跳转方法
 * */
push() {
  Navigator.pushNamed(context, "newPage").then((value) {
    if (value != null) print('接收到的参数：$value');
  });
}
返回到指定路由

这节我们使用popUntil方法返回到我们想要返回到的某个路由，首先再注册两个路由名：NewPage,TowPage

这样就实现了到第二个页面的时候点击回到首页按钮就直接返回到首页了。
#### 路由记录
我们每次跳转一个新路由然后想返回到之前跳转过的某个路由难道每个都要注册路由名吗？那样的话太麻烦了， 
这节就教大家路由记录，只要我们跳转过某个路由就记录起来， 然后最后面的路由想返回到前面的三个中的某个都不需要配置名字了。
#### 路由动画理论

 路由动画就是我们跳转到下一个路由栈的时候所产生的过度动画，官方提供了两个动画： MaterialPageRoute、CupertinoPageRoute；
 
 MaterialPageRoute：存在于：import 'package:flutter/material.dart';包；
 CupertinoPageRoute：存在于：import 'package:flutter/cupertino.dart';包；
代码中用的渐变动画：/*
                  * 渐变动画
                  * */
                  class FadeRoute extends PageRouteBuilder {
                    // 传过来的页面page
                    final Widget page;
                    // 构造
                    FadeRoute({this.page})
                        : super(
                      pageBuilder: (
                          BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation,
                          ) =>
                      page,
                      transitionsBuilder: (
                          BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation,
                          Widget child,
                          ) =>
                          FadeTransition(
                            opacity: animation, // 透明度
                            child: child, // 页面存放
                          ),
                    );
                  }
##### 在StatelessWidget页面中  如何去掉上下文context管理路由
        
        首先定义一个NavigatorKey，也就是GlobalKey全局Key，然后范型是NavigatorState：
        
        final navGK = new GlobalKey<NavigatorState>();
### 随时增加的知识技巧：


