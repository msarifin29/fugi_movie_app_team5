// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genres.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Genres _$$_GenresFromJson(Map<String, dynamic> json) => _$_Genres(
      genres: (json['genres'] as List<dynamic>)
          .map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_GenresToJson(_$_Genres instance) => <String, dynamic>{
      'genres': instance.genres,
    };

_$_Genre _$$_GenreFromJson(Map<String, dynamic> json) => _$_Genre(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$_GenreToJson(_$_Genre instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
