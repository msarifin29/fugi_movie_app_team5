// To parse this JSON data, do
//
//     final trendingMovie = trendingMovieFromJson(jsonString);

import 'package:fugi_movie_app_team5/Model/result/result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'trending_movie.freezed.dart';
part 'trending_movie.g.dart';

TrendingMovie trendingMovieFromJson(String str) =>
    TrendingMovie.fromJson(json.decode(str));

String trendingMovieToJson(TrendingMovie data) =>
    json.encode(trendingMovieToJson(data));

@freezed
abstract class TrendingMovie with _$TrendingMovie {
  const factory TrendingMovie({
    required int page,
    required List<Result> result,
    required int totalPages,
    required int totalResults,
  }) = _TrendingMovie;

  factory TrendingMovie.fromJson(Map<String, dynamic> json) =>
      _$TrendingMovieFromJson(json);
}
