import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fugi_movie_app_team5/View/trendingScreen/detail_screen.dart';
import 'package:intl/intl.dart';

import '../Controller/riverpod/movie_riverpod.dart';
import '../Model/movies/movies.dart';

class BuildMovieList extends ConsumerWidget {
  const BuildMovieList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieList = ref.watch(moviesController);
    return movieList.when(
      data: (movies) {
        List<Result> data = movies.map((e) => e).toList();
        return GridView.builder(
          itemCount: data.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.75,
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      id: data[index].id,
                    ),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 120,
                    height: 180,
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
                    "${data[index].originalTitle} (${DateFormat('yyyy').format(data[index].releaseDate)})",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
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
