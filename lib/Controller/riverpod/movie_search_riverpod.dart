import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fugi_movie_app_team5/Model/result/search_result.dart';
import 'package:fugi_movie_app_team5/Service/dio/search_movie.dart';

final movies = Provider<SearchMovieService>((ref) => SearchMovieService());

final searchMovieController = FutureProvider.autoDispose
    .family<List<SearchResult>, String>((ref, keyword) async {
  final searchData = ref.watch(movies);
  return searchData.searchMovie(keyword: keyword);
});
