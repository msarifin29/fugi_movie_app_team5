import 'package:fugi_movie_app_team5/Model/result/result.dart';
import 'package:fugi_movie_app_team5/Service/dio/api_service.dart';
import 'package:riverpod/riverpod.dart';

final trendingThisWeek = Provider<ApiService>((ref) => ApiService());

final trendingThisWeekFuture = FutureProvider<List<Result>>((ref) {
  return ref.watch(trendingThisWeek).getTrendingWeek();
});
