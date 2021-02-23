import 'package:flutter/material.dart';
import 'package:flutter_appl/pages/find/FindScreen.dart';
import 'package:flutter_appl/pages/widgets/BalanceScreen.dart';
import 'package:flutter_appl/pages/widgets/FavoriteList.dart';
import 'package:flutter_appl/pages/widgets/MusicScreen.dart';

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
    FavoriteList(),
    FindScreen(),
    MusicScreen(),
    BalanceScreen()
  ];

  int _currentIndex = 0;

  List<BottomNavigationBarItem> _itemList = [
    BottomNavigationBarItem(
      icon: Image.asset(
        'assets/images/invite_normal.png',
        width: 24, height: 24,
      ),
      title: new Text('好友'),
      activeIcon: Image.asset(
        'assets/images/invite_selected.png',
        width: 24, height: 24
      )
    ),
    BottomNavigationBarItem(
        icon: Image.asset(
          'assets/images/discovery_normal.png',
          width: 24, height: 24
        ),
        title: new Text('发现'),
        activeIcon: Image.asset(
          'assets/images/discovery_selected.png',
          width: 24, height: 24
        )
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/images/manager_normal.png',
          width: 24, height: 24
        ),
        title: new Text('管理'),
        activeIcon: Image.asset(
          'assets/images/manager_selected.png',
          width: 24, height: 24
        )
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/images/mine_normal.png',
          width: 24, height: 24
        ),
        title: new Text('我的'),
        activeIcon: Image.asset(
          'assets/images/mine_selected.png',
          width: 24, height: 24
        )
      ),
  ];

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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed , // 设置tabBar固定 不悬浮
        selectedItemColor: Color.fromARGB(255, 242, 89, 63),
        unselectedItemColor: Colors.blueGrey,
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: _itemList,
      ),
    );
  }
}