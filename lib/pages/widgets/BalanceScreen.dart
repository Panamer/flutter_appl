import 'package:flutter/material.dart';

class BalanceScreen extends StatelessWidget {
  const BalanceScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('银行'), 
      ),
      body:_buildContent()
    );
  }

  Widget _buildContent() {
    return new Center(
        child: Column(
          children: <Widget>[
            new Text(
              'Column',
              style: TextStyle(
                color: Colors.red,
                fontSize: 20, 
              ),
            ),
            new Text(
              '竖直布局',
              style: TextStyle(
                color: Colors.red,
                fontSize: 20, 
              ),
            ),
            new Container(
              width: 200,
              height: 300,
              color: Colors.blue,
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text('Row'),
                  new Text('横向'),
                  new Text('布局'),
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new Text('Column'),
                      new Text('竖直'),
                      new Text('布局'),
                   ], 
                  )
                ], 
              ),
            )
          ],
        ),
      );
  }
}