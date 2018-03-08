import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class SecondRoute extends MaterialPageRoute {
  Set<WordPair> _saved;
  final _biggerFont = new TextStyle(fontSize: 17.0);

  SecondRoute(this._saved);

  Widget _buildList(BuildContext context) {
    final tiles = _saved.map((pair) {
      return new ListTile(
        title: new Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
      );
    });
    final divided = ListTile
        .divideTiles(
          context: context,
          tiles: tiles,
        )
        .toList();

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Saved suggestions'),
      ),
      body: new ListView(children: divided),
    );
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return new MaterialApp(home: _buildList(context));
  }

  // @override
  // Widget buildPage(BuildContext context, Animation<double> animation,
  //     Animation<double> secondaryAnimation) {
  //   // TODO: implement buildPage
  //   new MaterialPageRoute(builder: (context) {
  //     final tiles = _saved.map((pair) {
  //       return new ListTile(
  //         title: new Text(
  //           pair.asPascalCase,
  //           style: _biggerFont,
  //         ),
  //       );
  //     });
  //     final divided = ListTile
  //         .divideTiles(
  //           context: context,
  //           tiles: tiles,
  //         )
  //         .toList();

  //     return new Scaffold(
  //       appBar: new AppBar(
  //         title: new Text('Saved suggestions'),
  //       ),
  //       body: new ListView(children: divided),
  //     );
  //   });
  // }
}
