// To parse this JSON data, do
//
//     final theMovie = theMovieFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'latest_movie.freezed.dart';
part 'latest_movie.g.dart';

LatestMovie latestMovieFromJson(String str) =>
    LatestMovie.fromJson(json.decode(str));

String latestMovieToJson(LatestMovie data) =>
    json.encode(latestMovieToJson(data));

@freezed
abstract class LatestMovie with _$LatestMovie {
  const factory LatestMovie({
    required bool adult,
    @JsonKey(name: 'backdrop_path') dynamic backdropPath,
    @JsonKey(name: 'belong_to_collection') dynamic belongsToCollection,
    required int? budget,
    required List<dynamic> genres,
    required String? homepage,
    required int id,
    @JsonKey(name: 'imdb_id') dynamic imdbId,
    @JsonKey(name: 'original_language') String? originalLanguage,
    @JsonKey(name: 'original_title') String? originalTitle,
    required String overview,
    required int? popularity,
    @JsonKey(name: 'poster_path') dynamic posterPath,
    @JsonKey(name: 'production_companies') List<dynamic>? productionCompanies,
    @JsonKey(name: 'production_countries') List<dynamic>? productionCountries,
    @JsonKey(name: 'release_date') String? releaseDate,
    required int revenue,
    required int runtime,
    @JsonKey(name: 'spoken_languages') List<dynamic>? spokenLanguages,
    required String status,
    required String tagline,
    required String title,
    required bool video,
    @JsonKey(name: 'vote_average') int? voteAverage,
    @JsonKey(name: 'vote_count') int? voteCount,
  }) = _LatestMovie;

  factory LatestMovie.fromJson(Map<String, dynamic> json) =>
      _$LatestMovieFromJson(json);
}
