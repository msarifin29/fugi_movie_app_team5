import 'dart:convert';
import 'package:dio/dio.dart';

import '../../Model/movies/movies.dart';

class DiscoverMovieService {
  Future<List<Result>> getMovie() async {
    const url =
        'https://api.themoviedb.org/3/movie/now_playing?api_key=5901633f2d04a1752502efc738f5616e';
    final dio = Dio();
    final response = await dio.get(url);
    final result = jsonDecode(response.toString())['results'] as List<dynamic>;
    return result.map((e) => Result.fromJson(e)).toList();
  }
}
