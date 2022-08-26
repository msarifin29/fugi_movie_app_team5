import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fugi_movie_app_team5/View/homeScreen/detail_screen.dart';

import '../Controller/riverpod/trending_all_day_riverpod.dart';

class BuildTrendingDay extends ConsumerWidget {
  const BuildTrendingDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue dataTrending = ref.watch(trendingDayProvider);
    return dataTrending.when(
        data: (data) {
          return Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: RichText(
                    text: TextSpan(
                      text: 'Trending ',
                      style: Theme.of(context).textTheme.titleLarge,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'All Day',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.38,
                  padding: const EdgeInsets.all(5),
                  width: double.infinity,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      // Original Title
                      var title = data[index].originalTitle;
                      return Column(
                        children: [
                          Stack(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                        id: data[index].id as int,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  height: 220,
                                  width: 150,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      'https://image.tmdb.org/t/p/w500${data[index].posterPath}',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 15,
                                right: 15,
                                child: Container(
                                  height: 30,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(69, 255, 255, 255),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/icon/icon_star_filled.png',
                                          color: const Color(0xfff3be00),
                                          width: 25,
                                        ),
                                        Text(
                                          data[index]
                                              .voteAverage!
                                              .toStringAsFixed(1),
                                          style: const TextStyle(
                                              color: Color(0xffffffff),
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              left: 10,
                            ),
                            width: 150,
                            child: Text(
                              title = title == null
                                  ? data[index].name.toString()
                                  : title.toString(),
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
        error: (err, s) => Scaffold(
              body: Text(
                err.toString(),
              ),
            ),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
