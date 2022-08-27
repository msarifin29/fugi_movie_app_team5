// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fugi_movie_app_team5/View/discover.dart';
import '../../Widget/build_trending_all_day.dart';
import '../../Widget/build_trending_this_week.dart';

class TrendingMovieScreen extends StatefulWidget {
  const TrendingMovieScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<TrendingMovieScreen> createState() => _TrendingMovieScreenState();
}

class _TrendingMovieScreenState extends State<TrendingMovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(
          'Movie',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [const BuildTrendingDay(), const BuildTrendingThisWeek()],
        ),
      ),
    );
  }
}
