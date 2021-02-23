import 'package:flutter/material.dart';
import 'package:flutter_appl/pages/FavoriteList.dart';
import 'package:flutter_appl/pages/ContactsScreen.dart';
import 'package:flutter_appl/pages/MusicScreen.dart';

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
            title: Text('列表')
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