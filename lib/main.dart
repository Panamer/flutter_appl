import 'package:flutter/material.dart';
import 'package:flutter_appl/pages/SecondScreen.dart';

void main() => runApp(new MyApp());

/// build 相当于render
/// MaterialApp应⽤组件: 封装了应⽤程序所需要的⼀些Widget，⾥⾯会有已有的⼀些组件
/// Scaffold脚⼿架组件
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: FirstScreen(),
      title: 'Flutter Big', // 只有在安卓 且 进入后台页面时才显示。 所以用处不大
      routes: <String, WidgetBuilder> {
        '/first': (BuildContext context) => new FirstScreen(),
        '/second': (BuildContext context) => new SecondScreen('显示的内容', title: '标题')
      },
      initialRoute: '/first',
      theme: ThemeData(primaryColor: Colors.orange),
    );
  }
}
/// 首页
class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('首页标题')
      ),
      body: new Center(
        child: new TextButton(
          child: Text('点击我跳转页面'),
          onPressed: () {
            Navigator.pushNamed(context, '/second');
          },
        )
      ),
    );
  }
}

// 从 fluter 到 原生  再到flutter页面， 性能消耗很大， 每到一个flutter页面启动一次渲染引擎