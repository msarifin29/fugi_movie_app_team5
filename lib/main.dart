import 'package:flutter/material.dart';
import 'package:fugi_movie_app_team5/View/detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fugi movie team 5',
      theme: ThemeData(),
      home: detail_screen(),
    );
  }
}
