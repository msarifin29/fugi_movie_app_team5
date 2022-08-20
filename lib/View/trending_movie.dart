import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../Controller/riverpod/trending_all_day_riverpod.dart';
import '../Model/result/result.dart';

// Using ConsumerWidget extends StatelessWidget
class TrendingMovieScreen extends ConsumerWidget {
  const TrendingMovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: no_leading_underscores_for_local_identifiers
    final dataTrending = ref.watch(trendingAllDayController);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Detail Movie'),
      ),
      body: dataTrending.when(
        data: (dataTrending) {
          List<Result> trendingList = dataTrending.map((e) => e).toList();
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: trendingList.length,
                  itemBuilder: (context, index) {
                    // Release Date
                    var date = dataTrending[index].releaseDate;
                    // First Air Date
                    var firstDate = dataTrending[index].firstAirDate;
                    // Original Title
                    var title = dataTrending[index].originalTitle;
                    return Card(
                      child: Container(
                        color: Colors.amberAccent,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          'https://image.tmdb.org/t/p/w500${trendingList[index].posterPath}'),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      title = title == null
                                          ? dataTrending[index].name.toString()
                                          : title.toString(),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      DateFormat.yMMMd()
                                          .format(date = date ?? firstDate!),
                                      style: const TextStyle(color: Colors.red),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // Text(
                            //     'overview ${trendingList[index].overview.toString()}'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
        error: (err, s) => Text(err.toString()),
        loading: () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
            Text(
              'Please wait !',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
