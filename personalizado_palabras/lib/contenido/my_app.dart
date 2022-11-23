import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/rendering.dart';
import '../contenido/random_words.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Generador de Palabras',
      home: RandomWords(),
    );
  }
}