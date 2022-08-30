import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fugi_movie_app_team5/Model/result/result.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shimmer/shimmer.dart';

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
                      var tittle = item.name;
                      var release = item.releaseDate;
                      return carouselCardTrending(
                          context, item, tittle, release);
                    }).toList(),
                    options: CarouselOptions(
                      height: 400,
                      viewportFraction: 0.65,
                      aspectRatio: 9 / 18,
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
            loading: () => loadingIndicator());
      },
    );
  }

  Builder loadingIndicator() {
    return Builder(
      builder: (context) {
        final Color color1 =
            const Color.fromARGB(255, 245, 245, 245).withOpacity(0.55);
        const Color color2 = Color.fromARGB(255, 224, 224, 224);
        // ignore: no_leading_underscores_for_local_identifiers
        const bool _enabled = true;
        List<Color> colors = [color1, color2];
        return Shimmer.fromColors(
          baseColor: color1,
          highlightColor: color2,
          enabled: _enabled,
          child: CarouselSlider(
            items: colors.map((item) {
              return SizedBox(
                child: Stack(
                  children: [
                    Container(
                      color: color1,
                      height: 300,
                      width: 200,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Positioned(
                      top: 330,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            color: color1,
                            height: 12,
                            width: 100,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            color: color1,
                            height: 12,
                            width: 120,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
            options: CarouselOptions(
              height: 400,
              viewportFraction: 0.65,
              aspectRatio: 9 / 18,
              enlargeCenterPage: true,
            ),
          ),
        );
      },
    );
  }

  Stack carouselCardTrending(
      BuildContext context, Result item, String? tittle, DateTime? release) {
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
            height: 300,
            width: 200,
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
          top: 280,
          left: 15,
          child: CircularPercentIndicator(
            radius: 22.0,
            lineWidth: 3.0,
            animation: true,
            percent: 0.7,
            center: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  const Icon(
                    Icons.star,
                    color: Color(0xffff8f71),
                    size: 16,
                  ),
                  Text(
                    item.voteAverage!.toStringAsFixed(1),
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 13, fontWeight: FontWeight.bold),
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
          child: Container(
            padding: const EdgeInsets.only(left: 15),
            width: 180,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tittle = tittle ?? item.originalTitle!,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(wordSpacing: 3),
                ),
                Text(
                  DateFormat.yMMMd()
                      .format(release = release ?? item.firstAirDate!),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.grey,
                      fontSize: 13,
                      letterSpacing: 1,
                      wordSpacing: 3),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
