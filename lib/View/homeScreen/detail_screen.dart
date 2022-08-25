import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fugi_movie_app_team5/Widget/list_movie.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class DetailScreen extends ConsumerWidget {
  DetailScreen(
      {Key? key,
      required this.banner,
      this.originalTitle,
      this.nameMovie,
      this.releaseDate,
      this.firstRelease,
      required this.voteAverage,
      required this.overview})
      : super(key: key);

  final String banner;
  String? originalTitle;
  String? nameMovie;
  DateTime? releaseDate;
  DateTime? firstRelease;
  final num voteAverage;
  final String overview;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 250,
              child: Image.network(
                'https://image.tmdb.org/t/p/w500$banner',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.7,
                        child: Text(
                          originalTitle = originalTitle == null
                              ? nameMovie!
                              : originalTitle.toString(),
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Container(
                        width: 29,
                        height: 22,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(
                                0.7,
                                0.7,
                              ), //Offset
                              blurRadius: 0.1,
                              spreadRadius: 0.20,
                            ), //BoxShadow
                            BoxShadow(
                              color: Colors.black,
                              offset: Offset(1, 1),
                              blurRadius: 0.0,
                              spreadRadius: 0.2,
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            '47K',
                            style: TextStyle(
                              color: Color.fromARGB(225, 240, 237, 237),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icon/icon_star_outlined.png',
                          color: const Color(0xffff8f71),
                        ),
                        Text('${voteAverage.toStringAsFixed(1)}  (IMDb)',
                            style: Theme.of(context).textTheme.bodyMedium)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.grey, //color of divider
              height: 25, //height spacing of divider
              thickness: 1, //thickness of divier line
              indent: 15, //spacing at the start of divider
              endIndent: 15, //spacing at the end of divider
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 55,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Release date',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        DateFormat.yMMMd()
                            .format(releaseDate = releaseDate ?? firstRelease!),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     Text('Genre',
                  //         style: Theme.of(context).textTheme.titleLarge),
                  //     Row(
                  //       children: [
                  //         Container(
                  //           width: 60,
                  //           height: 25,
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(20),
                  //             boxShadow: const [
                  //               BoxShadow(
                  //                 color: Colors.white,
                  //                 offset: Offset(
                  //                   0.7,
                  //                   0.7,
                  //                 ), //Offset
                  //                 blurRadius: 0.1,
                  //                 spreadRadius: 0.20,
                  //               ), //BoxShadow
                  //               BoxShadow(
                  //                 color: Colors.black,
                  //                 offset: Offset(1, 1),
                  //                 blurRadius: 0.0,
                  //                 spreadRadius: 0.2,
                  //               ), //BoxShadow
                  //             ],
                  //           ),
                  //           child: const Center(
                  //             child: Text(
                  //               'Action',
                  //               style: TextStyle(
                  //                   color: Color.fromARGB(225, 240, 237, 237)),
                  //             ),
                  //           ),
                  //         ),
                  //         const SizedBox(
                  //           width: 10,
                  //         ),
                  //         Container(
                  //           width: 60,
                  //           height: 25,
                  //           decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(20),
                  //               boxShadow: const [
                  //                 BoxShadow(
                  //                   color: Colors.white,
                  //                   offset: Offset(
                  //                     0.7,
                  //                     0.7,
                  //                   ), //Offset
                  //                   blurRadius: 0.1,
                  //                   spreadRadius: 0.20,
                  //                 ), //BoxShadow
                  //                 BoxShadow(
                  //                   color: Colors.black,
                  //                   offset: Offset(1, 1),
                  //                   blurRadius: 0.0,
                  //                   spreadRadius: 0.2,
                  //                 ),
                  //               ]),
                  //           child: const Center(
                  //             child: Text(
                  //               'Action',
                  //               style: TextStyle(
                  //                   color: Color.fromARGB(225, 240, 237, 237)),
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // )
                ],
              ),
            ),
            const Divider(
              color: Colors.grey, //color of divider
              height: 25, //height spacing of divider
              thickness: 1, //thickness of divier line
              indent: 15, //spacing at the start of divider
              endIndent: 15, //spacing at the end of divider
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text('Synosis',
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 15),
              child: Text(
                overview,
                style: Theme.of(context).textTheme.bodySmall,
                // maxLines: 6,
                // overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Related Movies',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 24,
              height: 147,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    list_movie(
                        link_image: 'assets/image/Mulan.jpg',
                        title: 'Mulan Maret 2020 (Indonesia)'),
                    const SizedBox(
                      width: 16,
                    ),
                    list_movie(
                        link_image: 'assets/image/The Last Jedi.jpg',
                        title: 'The Last Jedi  December  9,2017'),
                    const SizedBox(
                      width: 16,
                    ),
                    list_movie(
                        link_image: 'assets/image/The-Rise-of-Skywalker.jpg',
                        title: 'The Rise of Skywalker  2019'),
                    const SizedBox(
                      width: 16,
                    ),
                    list_movie(
                        link_image: 'assets/image/TheForceAwakens-Poster.jpg',
                        title: 'The Force Awakens 2015'),
                    const SizedBox(
                      width: 16,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
