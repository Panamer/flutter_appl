import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_appl/Application.dart';
import 'package:flutter_appl/pages/SecondScreen.dart';

class WelcomPage extends StatefulWidget {
  WelcomPage({Key key}) : super(key: key);

  @override
  _WelcomPageState createState() => _WelcomPageState();
}

class _WelcomPageState extends State<WelcomPage> {

  int counter = 5;

  Timer _timer;

  @override
  void initState() {
    super.initState();

    _timer = new Timer.periodic(new Duration(seconds: 1), (timer){
      if(counter == 1) {
        _timer.cancel();
        _timer = null;
        goHomePage();
      }
      setState(() {
        counter = --counter;
      });
    });
  }

  // 打开新的页面， 把欢迎页的路由删掉 节省内存
  goHomePage() {
    Navigator.of(context).pushAndRemoveUntil(
      new MaterialPageRoute(builder: (context) => new SecondScreen('显示的内容', title: '标题')), 
      (route) => route == null
    );
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size; // 获取屏幕尺寸 很慢
    Application.screenWidth = size.width;
    Application.screenHeight = size.height;
    Application.statusBarHeight = MediaQuery.of(context).padding.top;
    Application.bottomBarHeight = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      body: new Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.zero,
            child: Image.asset(
              'assets/images/SplashBgImage.jpg',
              height: Application.screenHeight,
              fit: BoxFit.cover,
            ), 
          ),
          Positioned(
            top: Application.statusBarHeight,
            right: 20,
            child: Chip(
              label: Text('$counter秒'),
              backgroundColor: Colors.transparent,
            )
          )
        ], 
      ),
    );
  }
}