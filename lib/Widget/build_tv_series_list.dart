import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../Controller/riverpod/tv_series_riverpod.dart';
import '../Model/tv_series/tv_series.dart';

class BuildTvSeriesList extends ConsumerWidget {
  const BuildTvSeriesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tvList = ref.watch(tvController);
    return tvList.when(
      data: (tvSeries) {
        List<Result> data = tvSeries.map((e) => e).toList();
        return GridView.builder(
          itemCount: data.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.75,
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 154,
                  height: (index % 3 == 0 || index == 0) ? 184 : 160,
                  margin: const EdgeInsets.only(bottom: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage(
                          'https://image.tmdb.org/t/p/w500${data[index].posterPath}',
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
                Text(
                  "${data[index].originalName} (${DateFormat('yyyy').format(data[index].firstAirDate)})",
                  style: const TextStyle(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ],
            );
          },
        );
      },
      error: (err, s) => Column(
        children: [
          Text(
            err.toString(),
          ),
        ],
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
