import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fugi_movie_app_team5/View/discover.dart';
import 'package:fugi_movie_app_team5/View/homeScreen/trending_movie.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          backgroundColor: const Color.fromARGB(21, 20, 31, 100),
          textTheme: const TextTheme(
            headlineMedium: TextStyle(
              color: Color(0xffff8f71),
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lato-Regular',
              letterSpacing: 2,
            ),
            headlineSmall: TextStyle(
              color: Color(0xffffffff),
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lato-Regular',
              letterSpacing: 1,
            ),
            titleLarge: TextStyle(
                color: Color(0xffffffff),
                fontFamily: 'Lato-Regular',
                fontSize: 18,
                fontWeight: FontWeight.bold),
            titleMedium: TextStyle(
                color: Color(0xffff8f71),
                fontFamily: 'Lato-Regular',
                fontSize: 16,
                fontWeight: FontWeight.bold),
            titleSmall: TextStyle(
                color: Color(0xffffffff),
                fontFamily: 'Lato-Regular',
                fontSize: 16,
                wordSpacing: 1,
                fontWeight: FontWeight.bold),
            bodyMedium: TextStyle(
                color: Color.fromARGB(255, 185, 184, 184), fontSize: 15),
            bodySmall: TextStyle(
              color: Color.fromARGB(255, 185, 184, 184),
              fontSize: 15,
              fontFamily: 'Lato-Regular',
            ),
          ),
        ),
        title: 'Fugi movie team 5',
        darkTheme: ThemeData(
          backgroundColor: const Color.fromARGB(21, 20, 31, 100),
          textTheme: const TextTheme(
            headlineMedium: TextStyle(
              color: Color(0xffff8f71),
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lato-Regular',
              letterSpacing: 2,
            ),
            headlineSmall: TextStyle(
              color: Color(0xffffffff),
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lato-Regular',
              letterSpacing: 1,
            ),
            titleLarge: TextStyle(
                color: Color(0xffffffff),
                fontFamily: 'Lato-Regular',
                fontSize: 18,
                fontWeight: FontWeight.bold),
            titleMedium: TextStyle(
                color: Color(0xffff8f71),
                fontFamily: 'Lato-Regular',
                fontSize: 16,
                fontWeight: FontWeight.bold),
            titleSmall: TextStyle(
                color: Color(0xffffffff),
                fontFamily: 'Lato-Regular',
                fontSize: 16,
                wordSpacing: 1,
                fontWeight: FontWeight.bold),
            bodyMedium: TextStyle(
                color: Color.fromARGB(255, 185, 184, 184), fontSize: 15),
            bodySmall: TextStyle(
              color: Color.fromARGB(255, 185, 184, 184),
              fontSize: 15,
              fontFamily: 'Lato-Regular',
            ),
          ),
        ),
        home: TrendingMovieScreen());
  }
}
