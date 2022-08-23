import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Controller/riverpod/trending_movie_this_week.dart';
import '../Model/result/result.dart';

class BuildTrendingThisWeek extends ConsumerWidget {
  const BuildTrendingThisWeek({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataThisWeek = ref.watch(trendingThisWeekController);
    return dataThisWeek.when(
      data: (dataThisWeek) {
        List<Result> data = dataThisWeek.map((e) => e).toList();
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
                        text: 'This week',
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
                  physics: const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics()),
                  padding: const EdgeInsets.only(top: 5),
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
                            InkWell(
                              onTap: () {},
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                margin: const EdgeInsets.all(10),
                                child: SizedBox(
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
                          padding: const EdgeInsets.only(left: 10),
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
              // Text(
              //   DateFormat.yMMMd()
              //       .format(date = date ?? firstDate!),
              //   style: const TextStyle(color: Colors.red),
              // ),
            ],
          ),
        );
      },
      error: (err, s) => Text(err.toString()),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
