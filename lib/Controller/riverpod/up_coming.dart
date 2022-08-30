import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Model/result/result.dart';
import '../../Service/dio/api_service.dart';

final upComingData = Provider((_) => ApiService());

final upComingProvider = FutureProvider<List<Result>>((ref) {
  return ref.watch(upComingData).getUpComing();
});

// final upComingProvider =
//     StateNotifierProvider<UpComingNotifier, AsyncValue<List<Result>>>(((
//   ref,
// ) {
//   final dataService = ref.read(upComingData);
//   return UpComingNotifier(dataService);
// }));

// class UpComingNotifier extends StateNotifier<AsyncValue<List<Result>>> {
//   UpComingNotifier(this._upComingService, [AsyncValue<List<Result>>? state])
//       : super(const AsyncValue.data([])) {
//     getTrendingDayNotifier();
//   }
//   final ApiService? _upComingService;

//   Future<void> getTrendingDayNotifier() async {
//     final dataUpComing = await _upComingService!.getUpComing();
//     state = const AsyncValue.loading();
//     if (mounted) {
//       state = (AsyncValue.data([...dataUpComing]));
//     }
//   }
// }
