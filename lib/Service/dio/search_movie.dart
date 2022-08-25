import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fugi_movie_app_team5/Model/result/result.dart';
import 'package:fugi_movie_app_team5/Model/result/search_result.dart';

class SearchMovieService {
  static Future<List<SearchResult>> searchMovie(
      {required String keyword, int page = 1}) async {
    // Url from the movie trending all day
    final url =
        'https://api.themoviedb.org/3/search/movie?api_key=5901633f2d04a1752502efc738f5616e&language=en-US&page=$page&include_adult=false&query=$keyword';
    final dio = Dio();
    final response = await dio.get(url);
    // Response decode as List<Map<String, dynamic>>
    final List result = jsonDecode(response.toString())['results'];
    return result.map(((e) => SearchResult.fromJson(e))).toList();
  }
}
