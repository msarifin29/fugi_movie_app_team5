import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Model/result/result.dart';
import '../../Service/dio/api_service.dart';

// final trendingAllDay =
//     Provider<TrendingAllDayService>((ref) => TrendingAllDayService());

// final trendingAllDayController = FutureProvider<List<Result>>((ref) async {
//   return ref.watch(trendingAllDay).getTrending();
// });

final trendingData = Provider((_) => ApiService());

final trendingDayProvider =
    StateNotifierProvider<TrendingDayNotifier, AsyncValue<List<Result>>>(((
  ref,
) {
  final dataService = ref.read(trendingData);
  return TrendingDayNotifier(dataService);
}));

class TrendingDayNotifier extends StateNotifier<AsyncValue<List<Result>>> {
  TrendingDayNotifier(this._trendingService, [AsyncValue<List<Result>>? state])
      : super(const AsyncValue.data([])) {
    getTrendingDayNotifier();
  }
  final ApiService? _trendingService;

  Future<void> getTrendingDayNotifier() async {
    final dataTrending = await _trendingService!.getTrendingDay();
    state = const AsyncValue.loading();
    if (mounted) {
      state = (AsyncValue.data([...dataTrending]));
    }
  }
}
