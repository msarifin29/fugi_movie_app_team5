import 'dart:convert';
import 'package:dio/dio.dart';

import '../../Model/documentary/documentary.dart';

class DiscoverDocumentaryService {
  Future<List<Result>> getDocumentary() async {
    const url =
        'https://api.themoviedb.org/3/discover/movie?api_key=5901633f2d04a1752502efc738f5616e&with_genres=99';
    final dio = Dio();
    final response = await dio.get(url);
    final result = jsonDecode(response.toString())['results'] as List<dynamic>;
    return result.map((e) => Result.fromJson(e)).toList();
  }
}
