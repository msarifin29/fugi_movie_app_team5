import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Model/result/result.dart';
import '../../Service/dio/trending_movie_all_day.dart';

final trendingAllDay =
    Provider<TrendingAllDayService>((ref) => TrendingAllDayService());

final trendingAllDayController = FutureProvider<List<Result>>((ref) async {
  return ref.watch(trendingAllDay).getTrending();
});
