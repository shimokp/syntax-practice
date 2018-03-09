import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class Second extends StatelessWidget {
  final Set<WordPair> _saved;
  final _biggerFont = new TextStyle(fontSize: 17.0);

  Second(this._saved);

  @override
  Widget build(BuildContext context) {
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
}
