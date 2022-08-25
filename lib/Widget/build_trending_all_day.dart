import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Controller/riverpod/trending_all_day_riverpod.dart';
import '../Model/result/result.dart';

class BuildTrendingAllDay extends ConsumerWidget {
  const BuildTrendingAllDay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataAllDay = ref.watch(trendingAllDayController);
    return dataAllDay.when(
      data: (dataAllDay) {
        List<Result> data = dataAllDay.map((e) => e).toList();
        return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 5,
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
              SizedBox(
                height: 290,
                width: double.infinity,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    // Release Date
                    var date = data[index].releaseDate;
                    // First Air Date
                    var firstDate = data[index].firstAirDate;
                    // Original Title
                    var title = data[index].originalTitle;
                    return Column(
                      children: [
                        Stack(
                          children: [
                            GestureDetector(
                              onTap: () {},
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
                                width: 50,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(69, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(15),
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
      ),
    );
  }
}
