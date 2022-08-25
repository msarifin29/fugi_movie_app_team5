import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Service/dio/discover_fantasy.dart';
import '../../Model/fantasy/fantasy.dart';

final fantasy =
    Provider<DiscoverFantasyService>((ref) => DiscoverFantasyService());

final fantasyController = FutureProvider<List<Result>>((ref) async {
  return ref.watch(fantasy).getFantasy();
});
