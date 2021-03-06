# flutter_shop ---- flutter做的一个商场项目   b9014b98399159d4139647528596d78d5c3c82f5

你能学到的知识点  

如何调用硬件与第三方服务
在flutter中调用硬件与第三方服务都可以通过集成对应的插件来完成:

用于访问位置信息GPS的插件:geolocator; （本文已经引入）

用于访问相册与相机的插件:image_picker;  （本文已经引入）

本地存储:用于Ios的UserDefaultes与安卓的sharedPreferences插件:shared_preferences

用于方位数据库的插件:SQFlite     数据存储，增删改查

用于唤起第三方登录Facebook的插件:flutter_facebook_login

用于推送通知的插件:firebase_messaging

用于使用Firebase的插件:firebase


在详细说明之前，把所有你能学到的知识点作了一张梳理图，可以帮助小伙伴更好的了解课程概况。

![image](https://github.com/1136346879/Image_Assert/blob/master/Flutter%E7%A7%BB%E5%8A%A8%E7%94%B5%E5%95%86%E5%AE%9E%E6%88%98-%E7%9F%A5%E8%AF%86%E7%82%B9%E6%A2%B3%E7%90%86.png)

 实现底部导航栏并点击切换页面可简述为有三种方式
    1,BottomNavigationBar + BottomNavigationBarItem(index_page页面)
    ![image](https://img-blog.csdnimg.cn/20200417160142240.gif)
    2,自定义 BottomAppBar   使用 BottomAppBar 来实现
    ![image](https://img-blog.csdnimg.cn/20200417155542593.gif#pic_center)
    3,TabBar + TabBarView
    ![image](https://img-blog.csdnimg.cn/20200417155632800.gif#pic_center)
    本demo三个示例都已写  在main.dart中可以随意替换
    
              home:BottomNavigationBarPage()  //    BottomNavigationBar + BottomNavigationBarItem(index_page页面)  + pageview
              home:BotomeAppBarPage()  //BottomAppBar
             home:BottomTabBarViewPage()  //   TabBar + TabBarView

1，Dio2.0:Dio是一个强大的Dart Http请求库，支持Restful API、FormData、拦截器、请求取消等操作。项目中将全面学习和使用Dio的操作。

2，Swiper：swiper滑动插件的使用，使用Swiper插件图片的切换效果。

3，路由Fluro：Flutter的路由机制很繁琐，如果是小型应用还勉强，但是真实开发我们都会使用企业级的路由机制，让路由清晰可用。项目中也会使用Fluro进行路由配置.Fluro也是目前最好的企业级Flutter路由。

4，屏幕适配：手机屏幕大小不同，布局难免有所不同，代码中将重点讲述Flutter的开发适配，一次开发适配所有屏幕，学完后可以都各种屏幕做到完美适配。

5，*上拉加载 *：如果稍微熟悉Flutter一点的小伙伴一定知道Flutter没有提供上拉加载这种插件，自己开发时非常麻烦的。代码中我将带着大家制作上拉加载效果。

6，本地存储：本地存储是一个App的必要功能，在项目中也大量用到了本地存储功能。

7，复杂页面的布局：会讲到如何布局复杂页面，如果解决多层嵌套地狱，如何写出优雅的代码。

8，其他知识点：还会设计到很多其他知识点，基本的Widget操作就超过50个
       （1），WillPopScope  路由跳转传值及返回数据返回到页面 -- 导航和安卓物理 返回拦截
       （2），GlobalKey 控件局部刷新
       （3），PageView 来回切换tab，保留页面状态
                   （4）， 路由页面跳转传参 并接受返回参数 Navigator.push( context,
                                                         MaterialPageRoute( // num传给下一级
                                                             builder: (context) => testRoute),  //普通刷新方式
                                                       ).then((value){//上一页面点击返回  传递回来的数据
                                                   //      if (value != null)
                                                           print('接收到的参数：$value'); });
#####  真机运行问题解决 Unsuported Android Plugin version: 3.5.3
### 随时增加的知识技巧：

1，组件化开发，完美复原APP核心页面

2，我们会最大程度的复原原来APP的UI界面和交互功能，让你熟练掌握Flutter的实战操作。

3，Fluter实战预热:环境的配置、项目代码结构的说明、dart文件的组件、路由的学习配置、项目代码的初始化。

4，APP首页开发：Header区域的制作、首页轮播效果的制作、图标区域实现、推荐区域制作、Bannder区域的制作，呼叫店长功能、楼层组件开发，火爆专区列表。

5，商品分类页面：动态组件的极致运用，一级分类的区域制作、二级分类的区域制作、商品列表组件开发、上拉加载更多功能的制作。

6，商品详情页面：路由的使用、商品图片制作、商品详情Webview组件、tab的真实开发。

7，购物车页面 : 包含购物车的整套功能，增加商品，调整数量，删除商品，运费计算，结账显示合计功能，超过运费的UI组件编写。

8，会员中心页面：顶部头像制作、订单区域通知功能、会员中心列表功能。

9，调试与上线：项目后台接口的调试技巧，真机如何测试，打包上线，后续学习指南。

10，接口文档：接口文档根据官方文档按时更新，让你做出一个拿的出去手的项目。


# flutter_demo_gank

[Flutter笔记(一)：BottomNavigationBar常见问题](https://www.jianshu.com/p/7274bad9f7ec)

[Flutter笔记(二)：Icon，ImageIcon,以及在Flutter中使用IconFont](https://www.jianshu.com/p/4ddcda91fa7d)

[Flutter笔记(三)：设置白色状态栏](https://www.jianshu.com/p/5cde325e6e05)

[Flutter笔记(四)：PageView-Flutter中的ViewPager](https://www.jianshu.com/p/4a52fb9957a8)

[Flutter笔记(五)：TabBar、TabBarView(TabLayout+ViewPager)](https://www.jianshu.com/p/8e28aa3ea9d4)

[Flutter笔记(六)：StaggeredGridView瀑布流+下拉刷新和加载更多](https://www.jianshu.com/p/4da555e7e4c3)

[Flutter笔记(七)：Dio网络请求、Json数据解析以及泛型问题](https://www.jianshu.com/p/3c50812865d1)

城市三级联动添加