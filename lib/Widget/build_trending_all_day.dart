import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../Controller/riverpod/trending_all_day_riverpod.dart';
import '../View/trendingScreen/detail_screen.dart';

class BuildTrendingDays extends StatefulWidget {
  const BuildTrendingDays({Key? key}) : super(key: key);

  @override
  State<BuildTrendingDays> createState() => _BuildTrendingDaysState();
}

class _BuildTrendingDaysState extends State<BuildTrendingDays> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final dataTrending = ref.watch(trendingDayProvider);
        return dataTrending.when(
          data: (data) {
            return Builder(
              builder: (context) {
                return CarouselSlider(
                  items: data.map((item) {
                    var release = item.releaseDate;
                    return Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                  id: item.id,
                                ),
                              ),
                            );
                          },
                          child: SizedBox(
                            height: 320,
                            width: 220,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                'https://image.tmdb.org/t/p/w500${item.posterPath}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 310,
                          left: 20,
                          child: CircularPercentIndicator(
                            radius: 25.0,
                            lineWidth: 4.0,
                            animation: true,
                            percent: 0.7,
                            center: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Column(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Color(0xffff8f71),
                                    size: 16,
                                  ),
                                  Text(
                                    '${item.voteAverage!.toStringAsFixed(1)} %',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: const Color(0xffff8f71),
                          ),
                        ),
                        Positioned(
                          top: 335,
                          left: 100,
                          child: SizedBox(
                            width: 120,
                            child: Text(
                              DateFormat.yMMMd().format(
                                  release = release ?? item.firstAirDate!),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(letterSpacing: 1, wordSpacing: 3),
                            ),
                          ),
                        )
                      ],
                    );
                  }).toList(),
                  options: CarouselOptions(
                    viewportFraction: 0.6,
                    aspectRatio: 9 / 16,
                    enlargeCenterPage: true,
                  ),
                );
              },
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
      },
    );
  }
}
