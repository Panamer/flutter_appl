import 'package:flutter/material.dart';
import 'package:flutter_appl/pages/BalanceScreen.dart';
import 'package:flutter_appl/pages/ContactsScreen.dart';
import 'package:flutter_appl/pages/MusicScreen.dart';
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

class SecondScreen extends StatefulWidget {
  final String content;
  final String title;
  // 构造函数
  SecondScreen(this.content, {this.title});
  
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

  // 定义界面容器
  final List<Widget> _children = [
    BalanceScreen(),
    ContactScreen(),
    MusicScreen()
  ];

  int _currentIndex = 0;

  void onTabTapped(int selectIndex) {
    setState(() {
      _currentIndex = selectIndex;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: new AppBar(
      //   title: new Text('${widget.title}')
      // ),
      body: _children[_currentIndex],
      drawer: new Drawer(
        child: new Center(
          child: Text(
            'Drawer',
            style: new TextStyle(
              fontSize: 20.0,
              color: Colors.blue,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.blueGrey,
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            // ignore: deprecated_member_use
            title: Text('银行')
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            title: Text('联系人'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            title: Text('音乐')
          ),
        ],
      ),
    );
  }
}


// 从 fluter 到 原生  再到flutter页面， 性能消耗很大， 每到一个flutter页面启动一次渲染引擎