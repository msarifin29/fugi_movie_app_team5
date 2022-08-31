import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fugi_movie_app_team5/Controller/riverpod/up_coming.dart';
import 'package:fugi_movie_app_team5/Model/result/result.dart';
import 'package:shimmer/shimmer.dart';

class BuildUpComing extends StatefulWidget {
  const BuildUpComing({Key? key}) : super(key: key);

  @override
  State<BuildUpComing> createState() => _BuildUpComingState();
}

class _BuildUpComingState extends State<BuildUpComing> {
  // ignore: prefer_final_fields
  final bool _enabled = true;

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
                      return caraouselCard(item, context, title);
                    }).toList(),
                    options: CarouselOptions(
                        height: 200,
                        viewportFraction: 0.9,
                        enlargeCenterPage: true,
                        reverse: true,
                        aspectRatio: 2.0,
                        autoPlay: true),
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

  Container loadingIndicator() {
    final Color color1 =
        const Color.fromARGB(255, 245, 245, 245).withOpacity(0.55);
    const Color color2 = Color.fromARGB(255, 224, 224, 224);
    return Container(
      width: 370,
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      height: 200,
      child: Shimmer.fromColors(
        baseColor: color1,
        highlightColor: color2,
        enabled: _enabled,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) => Container(
              color: color1,
              height: 180,
              width: 350,
            ),
            separatorBuilder: (context, index) => const SizedBox(width: 16),
          ),
        ),
      ),
    );
  }

  Stack caraouselCard(Result item, BuildContext context, String? title) {
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
          bottom: 32,
          left: 16,
          child: Container(
            height: 70,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color:
                    const Color.fromARGB(220, 158, 158, 158).withOpacity(0.5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/icon/icon_play_filled.png",
                  width: 40,
                  height: 40,
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Up Coming!',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xffBCBCBC)),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      title = title ?? item.name!,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
