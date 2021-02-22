import 'package:flutter/material.dart';

import 'package:english_words/english_words.dart';
import 'package:flutter_appl/model/post.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'flutter Generator',
      theme: new ThemeData(
        primaryColor: Colors.redAccent,
      ),
      home: new RandomWords(),
    );
  }
}
// 创建一个state类
class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];

  final _saved = new Set<WordPair>();

  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
      itemBuilder: (context, i) {
        // 奇数行 添加一个分割线
        if (i.isOdd) return new Divider();

        // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
        // 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
        final index = i ~/ 2;
        // 如果是建议列表中最后一个单词对
        if (index >= _suggestions.length) {
          // ...接着再生成10个单词对，然后添加到建议列表
          _suggestions.addAll(generateWordPairs().take(5));
        }
        // 偶数行添加一个listtile
        return _buildRow(_suggestions[index]);
      }
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
                onTap: () {
                  _pushImages();
                },
              );
            },
          );
          final divided = ListTile
            .divideTiles(
              context: context,
              tiles: tiles,
            )
            .toList();
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Saved Suggestions'),
              elevation: 0.0, // 去掉阴影
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }

  void _pushImages() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          return new Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: new AppBar(
              title: new Text('Saved Suggestions'),
            ),
            body: ListView.builder(
              itemCount: posts.length,
              itemBuilder: _listItemBuilder
            )
          );
        }
      )
    );
  }

  Widget _listItemBuilder(BuildContext context, int index) {
    final imageUrl = 'https://upload-images.jianshu.io/upload_images/5361063-e413832da0038304.png?imageMogr2/auto-orient/strip%7CimageView2/0/w/700';
    return new Container(
      color: Colors.white,
      margin: new EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Image.network(imageUrl),
          // Image.network("https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.res.jmbbs.com%2Fattachment%2Fforum%2F201906%2F24%2F135227gz22kwp1rp12zcc2.jpg&refer=http%3A%2F%2Fimg.res.jmbbs.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1616410199&t=11751a1cca65fd8e06c4541bb94ecbba"),
          SizedBox(height: 16.0),
          Text(
            posts[index].title,
            style: Theme.of(context).textTheme.subtitle1
          ),
          Text(
            posts[index].author,
            style: Theme.of(context).textTheme.caption
          ),
          SizedBox(height: 16.0)
        ],
      ),
    );
  }

}

// 添加一个state
class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}