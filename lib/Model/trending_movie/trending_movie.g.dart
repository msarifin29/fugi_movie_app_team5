// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trending_movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TrendingMovie _$$_TrendingMovieFromJson(Map<String, dynamic> json) =>
    _$_TrendingMovie(
      page: json['page'] as int,
      result: (json['result'] as List<dynamic>)
          .map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['totalPages'] as int,
      totalResults: json['totalResults'] as int,
    );

Map<String, dynamic> _$$_TrendingMovieToJson(_$_TrendingMovie instance) =>
    <String, dynamic>{
      'page': instance.page,
      'result': instance.result,
      'totalPages': instance.totalPages,
      'totalResults': instance.totalResults,
    };
