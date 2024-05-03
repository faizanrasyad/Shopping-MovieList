import 'package:flutter/material.dart';
import './pages/home_page.dart';
import './pages/item_page.dart';
import './pages/movie_list.dart';

void main() {
  runApp(MaterialApp(
    title: "Shopping & Movie",
    initialRoute: '/',
    routes: {
      '/': (context) => HomePage(),
      '/movielist': (context) => MovieList(),
    },
    debugShowCheckedModeBanner: false,
  ));
}
