import 'dart:convert';
import 'package:dio/dio.dart';

import '../../Model/fantasy/fantasy.dart';

class DiscoverFantasyService {
  Future<List<Result>> getFantasy() async {
    const url =
        'https://api.themoviedb.org/3/discover/movie?api_key=5901633f2d04a1752502efc738f5616e&with_genres=14';
    final dio = Dio();
    final response = await dio.get(url);
    final result = jsonDecode(response.toString())['results'] as List<dynamic>;
    return result.map((e) => Result.fromJson(e)).toList();
  }
}
