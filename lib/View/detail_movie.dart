import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../Controller/riverpod/trending_all_day_riverpod.dart';
import '../Model/result/result.dart';

// final trendingAllDayController = FutureProvider<List<Result>>((ref) async {
//   return ref.watch(trendingAllDay).getTrending();
// });

class DetailMovieScreen extends ConsumerWidget {
  const DetailMovieScreen({Key? key}) : super(key: key);

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
                            Text(
                                'overview ${trendingList[index].overview.toString()}'),
                            const SizedBox(
                              height: 20,
                            ),
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
