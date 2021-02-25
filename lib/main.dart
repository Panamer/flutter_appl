import 'package:flutter/material.dart';
import 'package:flutter_appl/WelcomePage.dart';
import 'package:flutter_appl/pages/FirstScreen.dart';
import 'package:flutter_appl/pages/SecondScreen.dart';

void main() => runApp(new MyApp());

/// build 相当于render
/// MaterialApp应⽤组件: 封装了应⽤程序所需要的⼀些Widget，⾥⾯会有已有的⼀些组件
/// Scaffold脚⼿架组件
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomPage(),
      title: 'Flutter Big', // 只有在安卓 且 进入后台页面时才显示。 所以用处不大
      routes: <String, WidgetBuilder>{
        '/first': (BuildContext context) => new FirstScreen(),
        '/second': (BuildContext context) =>
            new SecondScreen('显示的内容', title: '标题')
      },
      // initialRoute: '/first',
      theme: ThemeData(primaryColor: Colors.orange),
    );
  }
}
