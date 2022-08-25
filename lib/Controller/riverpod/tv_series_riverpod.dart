import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Service/dio/discover_tv_series.dart';
import '../../Model/tv_series/tv_series.dart';

final tv = Provider<DiscoverTvService>((ref) => DiscoverTvService());

final tvController = FutureProvider<List<Result>>((ref) async {
  return ref.watch(tv).getTvSeries();
});
