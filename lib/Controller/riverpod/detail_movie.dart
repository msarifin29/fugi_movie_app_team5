import 'package:riverpod/riverpod.dart';

import '../../Model/detail_movie/detail_movie.dart';
import '../../Model/detail_tv/detail_tv.dart';
import '../../Service/dio/api_service.dart';

final detailProvider = Provider((_) => ApiService());

final detailFuture =
    FutureProvider.autoDispose.family<DetailMovie?, int?>((ref, id) async {
  final detailData = ref.watch(detailProvider);
  return detailData.getDetailMovie(id!);
});

final detailTvFuture =
    FutureProvider.autoDispose.family<DetailTv?, int?>((ref, id) async {
  final detailData = ref.watch(detailProvider);
  return detailData.getDetailTv(id!);
});
