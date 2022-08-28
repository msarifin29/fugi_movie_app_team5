import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fugi_movie_app_team5/Controller/riverpod/up_coming.dart';

class BuildUpComing extends StatefulWidget {
  const BuildUpComing({Key? key}) : super(key: key);

  @override
  State<BuildUpComing> createState() => _BuildUpComingState();
}

class _BuildUpComingState extends State<BuildUpComing> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final dataUpComing = ref.watch(upComingProvider);
        return dataUpComing.when(
          data: (data) {
            return Builder(
              builder: (context) {
                return CarouselSlider(
                  items: data.map((item) {
                    var title = item.originalTitle;
                    return Stack(
                      children: [
                        SizedBox(
                          height: 180,
                          width: 380,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              'https://image.tmdb.org/t/p/w500${item.backdropPath}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 120,
                          left: 15,
                          child: Container(
                            height: 50,
                            padding: const EdgeInsets.only(
                                left: 15, top: 5, right: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color.fromARGB(220, 158, 158, 158),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Up Coming!',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  title = title ?? item.name!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                  options: CarouselOptions(
                      height: 200,
                      viewportFraction: 0.9,
                      enlargeCenterPage: true,
                      reverse: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer),
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
