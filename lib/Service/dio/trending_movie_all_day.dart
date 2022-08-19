import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fugi_movie_app_team5/Model/result/result.dart';

class TrendingAllDay {
  // Api from the movie trending all day
  final url =
      'https://api.themoviedb.org/3/trending/all/day?api_key=5901633f2d04a1752502efc738f5616e';
  Future<List<Result>> getTrending() async {
    final dio = Dio();
    final response = await dio.get(url);
    // Response decode as List<Map<String, dynamic>>
    final List result = jsonDecode(response.toString())['results'];
    return result.map(((e) => Result.fromJson(e))).toList();
  }
}
