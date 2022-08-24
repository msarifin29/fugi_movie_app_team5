// To parse this JSON data, do
//
//     final genres = genresFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'genres.freezed.dart';
part 'genres.g.dart';

Genres genresFromJson(String str) => Genres.fromJson(json.decode(str));

String genresToJson(Genres data) => json.encode(genresToJson(data));

@freezed
abstract class Genres with _$Genres {
  const factory Genres({
    required List<Genre> genres,
  }) = _Genres;

  factory Genres.fromJson(Map<String, dynamic> json) => _$GenresFromJson(json);
}

Genre genreFromJson(String str) => Genre.fromJson(jsonDecode(str));

String genreToJson(Genre data) => json.encode(genreToJson(data));

@freezed
abstract class Genre with _$Genre {
  const factory Genre({
    required int? id,
    required String? name,
  }) = _Genre;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}
