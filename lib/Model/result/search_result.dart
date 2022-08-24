// To parse this JSON data, do
//
//     final search_result = resultFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';
part 'search_result.freezed.dart';
part 'search_result.g.dart';

SearchResult resultFromJson(String str) =>
    SearchResult.fromJson(json.decode(str));
String resultToJson(SearchResult data) => json.encode((resultToJson(data)));

@freezed
abstract class SearchResult with _$SearchResult {
  @JsonSerializable(explicitToJson: true)
  const factory SearchResult({
    required bool adult,
    required int id,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'genre_ids') List<int>? genreIds,
    @JsonKey(name: 'original_language') String? originalLanguage,
    @JsonKey(name: 'original_title') String? originalTitle,
    required String overview,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'release_date') String? releaseDate,
    required String? title,
    required bool? video,
    @JsonKey(name: 'vote_count') int? voteCount,
    @JsonKey(name: 'vote_average') num? voteAverage,
    required num popularity,
  }) = _SearchResult;

  factory SearchResult.fromJson(Map<String, dynamic> json) =>
      _$SearchResultFromJson(json);
}
