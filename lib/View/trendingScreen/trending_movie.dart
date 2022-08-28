// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 220,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 20,
                  bottom: 20,
                ),
                child: RichText(
                  text: TextSpan(
                    text: 'Trending ',
                    style: Theme.of(context).textTheme.titleLarge,
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Day',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
              ),
              const BuildTrendingDays(),
              // const BuildTrendingThisWeek()
            ],
          ),
        ),
      ),
    );
  }
}
