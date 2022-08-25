import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Service/dio/discover_documentary.dart';
import '../../Model/documentary/documentary.dart';

final documentary =
    Provider<DiscoverDocumentaryService>((ref) => DiscoverDocumentaryService());

final documentaryController = FutureProvider<List<Result>>((ref) async {
  return ref.watch(documentary).getDocumentary();
});
