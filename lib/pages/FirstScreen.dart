import 'package:flutter/material.dart';

/// 首页
class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('首页标题')
      ),
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
