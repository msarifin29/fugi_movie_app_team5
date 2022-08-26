// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../../Widget/build_trending_all_day.dart';
import '../../Widget/build_trending_this_week.dart';

//Extend ConsumerWidget instead of StatelessWidget, which is exposed by Riverpod
class TrendingMovieScreen extends StatelessWidget {
  const TrendingMovieScreen({Key? key}) : super(key: key);

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
      bottomNavigationBar: Container(
        height: 50,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Color(0xff15141f),
        ),
      ),
    );
  }
}
