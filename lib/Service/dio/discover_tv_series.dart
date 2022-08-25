import 'dart:convert';
import 'package:dio/dio.dart';

import '../../Model/tv_series/tv_series.dart';

class DiscoverTvService {
  Future<List<Result>> getTvSeries() async {
    const url =
        'https://api.themoviedb.org/3/tv/on_the_air?api_key=5901633f2d04a1752502efc738f5616e';
    final dio = Dio();
    final response = await dio.get(url);
    final result = jsonDecode(response.toString())['results'] as List<dynamic>;
    return result.map((e) => Result.fromJson(e)).toList();
  }
}
