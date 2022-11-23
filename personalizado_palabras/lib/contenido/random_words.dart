import 'package:english_words/english_words.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../contenido/my_app.dart';

class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = <WordPair> {};
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generador de Palabras'),
        backgroundColor: Colors.greenAccent,
        actions: [
          IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: _pushFavorite,
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return const Divider();

          final index = i ~/ 2;

          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }

          final alreadySaved = _saved.contains(_suggestions[index]);

          return ListTile(
            title: Text(
              _suggestions[index].asPascalCase,
              style: _biggerFont,
            ),

            trailing: Icon(
              alreadySaved ? Icons.favorite : Icons.favorite_border,
              color: alreadySaved ? Colors.red : null,
              semanticLabel: alreadySaved ? 'Renove from saved' : 'Save',
            ),
            onTap: () {
              setState(() {
                if (alreadySaved) {
                  _saved.remove(_suggestions[index]);
                } else {
                  _saved.add(_suggestions[index]);
                }
              });
            },
          );
        },
      ),
      backgroundColor: Colors.black12,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.greenAccent,
        animationDuration: const Duration(milliseconds: 300),
        items: const [
          Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 35,
          ),
          Icon(
            Icons.pending_sharp,
            color: Colors.white,
            size: 35,
          ),
          Icon(
            Icons.menu,
            color: Colors.white,
            size: 35  ,
          ),
        ],
      ),
      //bottomNavigationBar: BottomNavigationBar(
        //backgroundColor: Colors.white,
        //items: const [
          //BottomNavigationBarItem(icon: Icon(Icons.arrow_back), label: 'Atras',),
          //BottomNavigationBarItem(icon: Icon(Icons.pentagon), label: 'Abrir recientes',),
          //BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu',),
        //],
      //),
    );
  }
  void _pushFavorite() {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) {
            final tiles = _saved.map(
                (pair) {
                  return ListTile(
                    title: Text(
                      pair.asPascalCase,
                      style: _biggerFont,
                    ),
                  );
                }
            );
            final divided = tiles.isNotEmpty
                ? ListTile.divideTiles(
              context: context,
              tiles: tiles,
            ).toList()
                : <Widget>[];

            return Scaffold(
              appBar: AppBar(
                title: const Text('Palabras Seleccionadas'),
                backgroundColor: Colors.greenAccent,
              ),
              body: ListView(children: divided),
              backgroundColor: Colors.greenAccent.shade100,
            );
          },
      ),
    );
  }
}