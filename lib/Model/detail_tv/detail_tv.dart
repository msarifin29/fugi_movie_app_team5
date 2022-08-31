// To parse this JSON data, do
//
//     final detailTv = detailTvFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'detail_tv.freezed.dart';
part 'detail_tv.g.dart';

DetailTv detailTvFromJson(String str) => DetailTv.fromJson(json.decode(str));

String detailTvToJson(DetailTv data) => json.encode(detailTvToJson(data));

@freezed
abstract class DetailTv with _$DetailTv {
  const factory DetailTv({
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'created_by') List<CreatedBy>? createdBy,
    @JsonKey(name: 'episode_run_time') List<int>? episodeRunTime,
    @JsonKey(name: 'first_air_date') DateTime? firstAirDate,
    required List<Genre> genres,
    required String? homepage,
    required int id,
    @JsonKey(name: 'in_production') bool? inProduction,
    required List<String> languages,
    @JsonKey(name: 'last_air_date') DateTime? lastAirDate,
    @JsonKey(name: 'last_episode_to_air') LastEpisodeToAir? lastEpisodeToAir,
    required String name,
    @JsonKey(name: 'next_episode_to_air') dynamic nextEpisodeToAir,
    required List<Network>? networks,
    @JsonKey(name: 'number_of_episodes') int? numberOfEpisodes,
    @JsonKey(name: 'number_of_seasons') int? numberOfSeasons,
    @JsonKey(name: 'origin_country') List<String>? originCountry,
    @JsonKey(name: 'original_language') String? originalLanguage,
    @JsonKey(name: 'original_name') String? originalName,
    required String? overview,
    required double? popularity,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'production_companies') List<Network>? productionCompanies,
    @JsonKey(name: 'production_countries')
        List<ProductionCountry>? productionCountries,
    required List<Season>? seasons,
    @JsonKey(name: 'spoken_languages') List<SpokenLanguage>? spokenLanguages,
    required String? status,
    required String? tagline,
    required String? type,
    required double? voteAverage,
    required int? voteCount,
  }) = _DetailTv;

  factory DetailTv.fromJson(Map<String, dynamic> json) =>
      _$DetailTvFromJson(json);
}

@freezed
abstract class CreatedBy with _$CreatedBy {
  const factory CreatedBy({
    required int id,
    @JsonKey(name: 'credit_id') String? creditId,
    required String name,
    required int gender,
    @JsonKey(name: 'profile_path') String? profilePath,
  }) = _CreatedBy;

  factory CreatedBy.fromJson(Map<String, dynamic> json) =>
      _$CreatedByFromJson(json);
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
abstract class LastEpisodeToAir with _$LastEpisodeToAir {
  const factory LastEpisodeToAir({
    @JsonKey(name: 'air_date') DateTime? airDate,
    @JsonKey(name: 'episode_number') int? episodeNumber,
    required int id,
    required String name,
    required String overview,
    @JsonKey(name: 'production_code') String? productionCode,
    @JsonKey(name: 'season_number') int? seasonNumber,
    @JsonKey(name: 'still_path') String? stillPath,
    @JsonKey(name: 'vote_average') double? voteAverage,
    @JsonKey(name: 'vote_count') int? voteCount,
  }) = _LastEpisodeToAir;

  factory LastEpisodeToAir.fromJson(Map<String, dynamic> json) =>
      _$LastEpisodeToAirFromJson(json);
}

@freezed
abstract class Network with _$Network {
  const factory Network({
    required String name,
    required int id,
    @JsonKey(name: 'logo_path') String? logoPath,
    @JsonKey(name: 'origin_country') String? originCountry,
  }) = _Network;

  factory Network.fromJson(Map<String, dynamic> json) =>
      _$NetworkFromJson(json);
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
abstract class Season with _$Season {
  const factory Season({
    @JsonKey(name: 'air_date') DateTime? airDate,
    @JsonKey(name: 'episode_count') int? episodeCount,
    required int id,
    required String name,
    required String overview,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'season_number') int? seasonNumber,
  }) = _Season;

  factory Season.fromJson(Map<String, dynamic> json) => _$SeasonFromJson(json);
}

@freezed
abstract class SpokenLanguage with _$SpokenLanguage {
  const factory SpokenLanguage({
    @JsonKey(name: 'english_name') String? englishName,
    @JsonKey(name: 'iso_639_1') String? iso6391,
    required String name,
  }) = _SpokenLanguage;

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageFromJson(json);
}
