import 'package:fugi_movie_app_team5/Service/dio/detail_service.dart';
import 'package:riverpod/riverpod.dart';

import '../../Model/detail_movie/detail_movie.dart';

final detailProvider = Provider((_) => DetailService());

final detailFuture =
    FutureProvider.autoDispose.family<DetailMovie, int>((ref, id) async {
  final detailData = ref.watch(detailProvider);
  return detailData.getDetailMovie(id);
});
