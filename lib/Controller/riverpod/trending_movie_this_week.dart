import 'package:fugi_movie_app_team5/Model/result/result.dart';
import 'package:riverpod/riverpod.dart';

import '../../Service/dio/trending_movie_this_week.dart';

final trendingThisWeek =
    Provider<TrendingThisWeekService>((ref) => TrendingThisWeekService());

final trendingThisWeekController = FutureProvider<List<Result>>((ref) {
  return ref.watch(trendingThisWeek).getTrending();
});
