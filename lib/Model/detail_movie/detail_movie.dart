// To parse this JSON data, do
//
//     final detailMovie = detailMovieFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'detail_movie.freezed.dart';
part 'detail_movie.g.dart';

DetailMovie detailMovieFromJson(String str) =>
    DetailMovie.fromJson(json.decode(str));

String detailMovieToJson(DetailMovie data) => json.encode(data.toJson());

@freezed
abstract class DetailMovie with _$DetailMovie {
  const factory DetailMovie({
    required bool? adult,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'belongs_to_collection') dynamic belongsToCollection,
    required int budget,
    required List<Genre> genres,
    required String? homepage,
    required int id,
    @JsonKey(name: 'imdb_id') String? imdbId,
    @JsonKey(name: 'original_language') String? originalLanguage,
    @JsonKey(name: 'original_title') String? originalTitle,
    required String overview,
    required double popularity,
    required dynamic posterPath,
    @JsonKey(name: 'production_companies')
        List<ProductionCompany>? productionCompanies,
    @JsonKey(name: 'production_countries')
        List<ProductionCountry>? productionCountries,
    @JsonKey(name: 'release_date') DateTime? releaseDate,
    required int revenue,
    required int runtime,
    @JsonKey(name: 'spoken_languages') List<SpokenLanguage>? spokenLanguages,
    required String status,
    required String tagline,
    required String title,
    required bool? video,
    @JsonKey(name: 'vote_average') double? voteAverage,
    @JsonKey(name: 'vote_count') int? voteCount,
  }) = _DetailMovie;

  factory DetailMovie.fromJson(Map<String, dynamic> json) =>
      _$DetailMovieFromJson(json);
}

@freezed
abstract class Genre with _$Genre {
  const factory Genre({
    required int id,
    required String name,
  }) = _Genre;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}

@freezed
abstract class ProductionCompany with _$ProductionCompany {
  const factory ProductionCompany({
    required int id,
    @JsonKey(name: 'logo_path') String? logoPath,
    required String name,
    @JsonKey(name: 'origin_country') String? originCountry,
  }) = _ProductionCompany;

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyFromJson(json);
}

@freezed
abstract class ProductionCountry with _$ProductionCountry {
  const factory ProductionCountry({
    @JsonKey(name: 'iso_3166_1') String? iso31661,
    required String name,
  }) = _ProductionCountry;

  factory ProductionCountry.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryFromJson(json);
}

@freezed
abstract class SpokenLanguage with _$SpokenLanguage {
  const factory SpokenLanguage({
    @JsonKey(name: 'iso_639_1') String? iso6391,
    required String name,
  }) = _SpokenLanguage;

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageFromJson(json);
}
