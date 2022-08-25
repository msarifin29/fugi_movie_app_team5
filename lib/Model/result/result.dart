// To parse this JSON data, do
//
//     final result = resultFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';
part 'result.freezed.dart';
part 'result.g.dart';

Result resultFromJson(String str) => Result.fromJson(json.decode(str));
String resultToJson(Result data) => json.encode((resultToJson(data)));

@freezed
abstract class Result with _$Result {
  @JsonSerializable(explicitToJson: true)
  const factory Result({
    required bool adult,
    required int id,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'genre_ids') List<int>? genreIds,
    @JsonKey(name: 'original_language') String? originalLanguage,
    @JsonKey(name: 'original_title') String? originalTitle,
    required String overview,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'release_date') DateTime? releaseDate,
    @JsonKey(name: 'first_air_date') DateTime? firstAirDate,
    required String? title,
    required bool? video,
    @JsonKey(name: 'vote_count') int? voteCount,
    @JsonKey(name: 'vote_average') num? voteAverage,
    required num popularity,
    required String? name,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
