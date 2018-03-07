import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class RandomWords extends StatefulWidget {
  // @override
  // State<StatefulWidget> createState() {
  //   // TODO: implement createState
  //   return new RandomWordsState();
  // }

  // 上と同じ
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    // final wordPair = new WordPair.random();
    // return new Text(wordPair.asPascalCase);
    return _buildSuggestions();
  }

  Widget _buildSuggestions() {
    return new ListView.builder(itemBuilder: (buildContext, i) {
      if (i.isOdd) return new Divider(); // 奇数

      final index = i ~/ 2;
      if (index >= _suggestions.length) {
        _suggestions.addAll(generateWordPairs().take(10));
      }
      return _buildRow(_suggestions[index]);
    });
  }

  Widget _buildRow(WordPair pair) {
    return new ListTile(
        title: new Text(
      pair.asPascalCase,
      style: _biggerFont,
    ));
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text('Welcome to Flutter'),
          ),
          body: new Center(child: new RandomWords())),
    );
  }
}
