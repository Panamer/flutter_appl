import 'package:flutter/material.dart';

class MusicScreen extends StatelessWidget {
  const MusicScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('音乐'), 
      ),
      body: Center(
        child: new Text('音乐'), 
      ),
    );
  }
}