import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TrendingMovieScreen extends ConsumerWidget {
  const TrendingMovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Trending'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: () {}, child: const Text('Day')),
              ElevatedButton(onPressed: () {}, child: const Text('Week')),
              ElevatedButton(onPressed: () {}, child: const Text('Latest')),
            ],
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
