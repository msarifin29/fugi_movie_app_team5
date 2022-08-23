import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Widget/build_trending_all_day.dart';
import '../Widget/build_trending_this_week.dart';

//Extend ConsumerWidget instead of StatelessWidget, which is exposed by Riverpod
class TrendingMovieScreen extends ConsumerWidget {
  const TrendingMovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          children: const [
            BuildTrendingAllDay(),
            BuildTrendingThisWeek(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xff15141f),
        ),
      ),
    );
  }
}
