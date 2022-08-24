import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fugi_movie_app_team5/View/trending_movie.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
      title: 'Fugi movie team 5',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
    );
=======
        title: 'Fugi movie team 5',
        darkTheme: ThemeData(
          backgroundColor: const Color(0xff15141f),
          textTheme: const TextTheme(
            headlineMedium: TextStyle(
              color: Color(0xffff8f71),
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lato-Regular',
              letterSpacing: 2,
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
                wordSpacing: 2,
                fontWeight: FontWeight.bold),
          ),
        ),
        home: const TrendingMovieScreen());
>>>>>>> 36bbd46af0ac8d906b780c62e5135603324e172b
  }
}
