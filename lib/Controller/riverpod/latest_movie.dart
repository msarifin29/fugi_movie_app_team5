import 'package:fugi_movie_app_team5/Model/latest_movie/latest_movie.dart';
import 'package:fugi_movie_app_team5/Service/dio/api_service.dart';
import 'package:riverpod/riverpod.dart';

final latestData = Provider((_) => ApiService());

final latestProvider = FutureProvider<LatestMovie>((ref) {
  return ref.watch(latestData).getLatest();
});
