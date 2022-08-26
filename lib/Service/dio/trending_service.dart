import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fugi_movie_app_team5/Model/result/result.dart';

class TrendingService {
  // Url from the movie trending all day
  final baseUrl = 'https://api.themoviedb.org/3';
  // Apikey
  final apiKey = '5901633f2d04a1752502efc738f5616e';

  Future<List<Result>> getTrendingDay() async {
    final dio = Dio();
    final response = await dio.get('$baseUrl/trending/all/day?api_key=$apiKey');
    if (response.statusCode != 200) {
      // ignore: avoid_print
      print('Request failed with status: ${response.statusCode}.');
      // return;
      throw ("Status Error");
    } // Response decode as List<Map<String, dynamic>>
    final List result = jsonDecode(response.toString())['results'];
    return result.map(((e) => Result.fromJson(e))).toList();
  }

  Future<List<Result>> getTrendingWeek() async {
    final dio = Dio();
    final response =
        await dio.get('$baseUrl/trending/all/week?api_key=$apiKey');
    if (response.statusCode != 200) {
      // ignore: avoid_print
      print('Request failed with status: ${response.statusCode}.');
      // return;
      throw ("Status Error");
    } // Response decode as List<Map<String, dynamic>>
    final List result = jsonDecode(response.toString())['results'];
    return result.map(((e) => Result.fromJson(e))).toList();
  }
}
