import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fugi_movie_app_team5/Controller/riverpod/movie_search_riverpod.dart';
import 'package:fugi_movie_app_team5/Model/result/search_result.dart';

class BuildMovieSearchList extends ConsumerWidget {
  const BuildMovieSearchList({
    required String this.keyword,
    Key? key,
  }) : super(key: key);
  final String? keyword;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieList = ref.watch(searchMovieController(keyword!));
    return movieList.when(
      data: (movies) {
        List<SearchResult> data = movies.map((e) => e).toList();
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
                  "${data[index].originalTitle} ${data[index].releaseDate!.isEmpty ? '' : '(${data[index].releaseDate!.split('-')[0]})'}",
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
