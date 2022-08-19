// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'trending_movie.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TrendingMovie _$TrendingMovieFromJson(Map<String, dynamic> json) {
  return _TrendingMovie.fromJson(json);
}

/// @nodoc
mixin _$TrendingMovie {
  int get page => throw _privateConstructorUsedError;
  List<Result> get result => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  int get totalResults => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrendingMovieCopyWith<TrendingMovie> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrendingMovieCopyWith<$Res> {
  factory $TrendingMovieCopyWith(
          TrendingMovie value, $Res Function(TrendingMovie) then) =
      _$TrendingMovieCopyWithImpl<$Res>;
  $Res call({int page, List<Result> result, int totalPages, int totalResults});
}

/// @nodoc
class _$TrendingMovieCopyWithImpl<$Res>
    implements $TrendingMovieCopyWith<$Res> {
  _$TrendingMovieCopyWithImpl(this._value, this._then);

  final TrendingMovie _value;
  // ignore: unused_field
  final $Res Function(TrendingMovie) _then;

  @override
  $Res call({
    Object? page = freezed,
    Object? result = freezed,
    Object? totalPages = freezed,
    Object? totalResults = freezed,
  }) {
    return _then(_value.copyWith(
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      result: result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as List<Result>,
      totalPages: totalPages == freezed
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalResults: totalResults == freezed
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_TrendingMovieCopyWith<$Res>
    implements $TrendingMovieCopyWith<$Res> {
  factory _$$_TrendingMovieCopyWith(
          _$_TrendingMovie value, $Res Function(_$_TrendingMovie) then) =
      __$$_TrendingMovieCopyWithImpl<$Res>;
  @override
  $Res call({int page, List<Result> result, int totalPages, int totalResults});
}

/// @nodoc
class __$$_TrendingMovieCopyWithImpl<$Res>
    extends _$TrendingMovieCopyWithImpl<$Res>
    implements _$$_TrendingMovieCopyWith<$Res> {
  __$$_TrendingMovieCopyWithImpl(
      _$_TrendingMovie _value, $Res Function(_$_TrendingMovie) _then)
      : super(_value, (v) => _then(v as _$_TrendingMovie));

  @override
  _$_TrendingMovie get _value => super._value as _$_TrendingMovie;

  @override
  $Res call({
    Object? page = freezed,
    Object? result = freezed,
    Object? totalPages = freezed,
    Object? totalResults = freezed,
  }) {
    return _then(_$_TrendingMovie(
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      result: result == freezed
          ? _value._result
          : result // ignore: cast_nullable_to_non_nullable
              as List<Result>,
      totalPages: totalPages == freezed
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalResults: totalResults == freezed
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TrendingMovie implements _TrendingMovie {
  const _$_TrendingMovie(
      {required this.page,
      required final List<Result> result,
      required this.totalPages,
      required this.totalResults})
      : _result = result;

  factory _$_TrendingMovie.fromJson(Map<String, dynamic> json) =>
      _$$_TrendingMovieFromJson(json);

  @override
  final int page;
  final List<Result> _result;
  @override
  List<Result> get result {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_result);
  }

  @override
  final int totalPages;
  @override
  final int totalResults;

  @override
  String toString() {
    return 'TrendingMovie(page: $page, result: $result, totalPages: $totalPages, totalResults: $totalResults)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TrendingMovie &&
            const DeepCollectionEquality().equals(other.page, page) &&
            const DeepCollectionEquality().equals(other._result, _result) &&
            const DeepCollectionEquality()
                .equals(other.totalPages, totalPages) &&
            const DeepCollectionEquality()
                .equals(other.totalResults, totalResults));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(page),
      const DeepCollectionEquality().hash(_result),
      const DeepCollectionEquality().hash(totalPages),
      const DeepCollectionEquality().hash(totalResults));

  @JsonKey(ignore: true)
  @override
  _$$_TrendingMovieCopyWith<_$_TrendingMovie> get copyWith =>
      __$$_TrendingMovieCopyWithImpl<_$_TrendingMovie>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TrendingMovieToJson(
      this,
    );
  }
}

abstract class _TrendingMovie implements TrendingMovie {
  const factory _TrendingMovie(
      {required final int page,
      required final List<Result> result,
      required final int totalPages,
      required final int totalResults}) = _$_TrendingMovie;

  factory _TrendingMovie.fromJson(Map<String, dynamic> json) =
      _$_TrendingMovie.fromJson;

  @override
  int get page;
  @override
  List<Result> get result;
  @override
  int get totalPages;
  @override
  int get totalResults;
  @override
  @JsonKey(ignore: true)
  _$$_TrendingMovieCopyWith<_$_TrendingMovie> get copyWith =>
      throw _privateConstructorUsedError;
}
