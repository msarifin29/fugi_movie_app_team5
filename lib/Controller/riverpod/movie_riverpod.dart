import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Service/dio/discover_movie.dart';
import '../../Model/movies/movies.dart';

final movies = Provider<DiscoverMovieService>((ref) => DiscoverMovieService());

final moviesController = FutureProvider<List<Result>>((ref) async {
  return ref.watch(movies).getMovie();
});
