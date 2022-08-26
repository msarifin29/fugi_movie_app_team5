import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fugi_movie_app_team5/Model/detail_movie/detail_movie.dart';

class DetailService {
  // Url from the movie trending all day
  final baseUrl = 'https://api.themoviedb.org/3';
  // Apikey
  final apiKey = '5901633f2d04a1752502efc738f5616e';
  Future<DetailMovie> getDetailMovie(int id) async {
    final response = await Dio().get('$baseUrl/movie/$id?api_key=$apiKey');
    if (response.statusCode != 200) {
      throw (e) {
        print(e.toString());
      };
    }
    var data = jsonDecode(response.toString()) as Map<String, dynamic>;

    return DetailMovie.fromJson(data);
  }
}
