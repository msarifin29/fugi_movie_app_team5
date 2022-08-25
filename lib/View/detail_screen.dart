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
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 250,
              child: Image.network(
                'https://image.tmdb.org/t/p/w500$banner',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 24,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              originalTitle = originalTitle == null
                                  ? nameMovie!
                                  : originalTitle.toString(),
                              style: Theme.of(context).textTheme.headlineSmall,
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
                              // Image(
                              //     image: AssetImage(
                              //         'assets/icon/icon_time.png')),
                              // Text(
                              //   '152 minutes',
                              //   style: TextStyle(
                              //       color: Color.fromARGB(255, 185, 184, 184),
                              //       fontSize: 15),
                              // ),
                              // Padding(padding: EdgeInsets.only(left: 10)),
                              Image.asset(
                                'assets/icon/icon_star_outlined.png',
                                color: const Color(0xffff8f71),
                              ),
                              Text(
                                '${voteAverage.toStringAsFixed(1)}  (IMDb)',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey, //color of divider
                    height: 25, //height spacing of divider
                    thickness: 1, //thickness of divier line
                    indent: 15, //spacing at the start of divider
                    endIndent: 15, //spacing at the end of divider
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 24,
                    height: 55,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Release date',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            SizedBox(height: 10),
                            Text(
                              DateFormat.yMMMd().format(
                                  releaseDate = releaseDate ?? firstRelease!),
                              style: TextStyle(
                                  color: Color.fromARGB(255, 185, 184, 184),
                                  fontSize: 13),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(left: 50)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Genre',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            Padding(padding: EdgeInsets.only(top: 5)),
                            Row(
                              children: [
                                Container(
                                  width: 60,
                                  height: 25,
                                  child: Center(
                                    child: Text(
                                      'Action',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              225, 240, 237, 237)),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white,
                                        offset: const Offset(
                                          0.7,
                                          0.7,
                                        ), //Offset
                                        blurRadius: 0.1,
                                        spreadRadius: 0.20,
                                      ), //BoxShadow
                                      BoxShadow(
                                        color: Colors.black,
                                        offset: const Offset(1, 1),
                                        blurRadius: 0.0,
                                        spreadRadius: 0.2,
                                      ), //BoxShadow
                                    ],
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(left: 10)),
                                Container(
                                  width: 60,
                                  height: 25,
                                  child: Center(
                                    child: Text(
                                      'Action',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              225, 240, 237, 237)),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white,
                                          offset: const Offset(
                                            0.7,
                                            0.7,
                                          ), //Offset
                                          blurRadius: 0.1,
                                          spreadRadius: 0.20,
                                        ), //BoxShadow
                                        BoxShadow(
                                          color: Colors.black,
                                          offset: const Offset(1, 1),
                                          blurRadius: 0.0,
                                          spreadRadius: 0.2,
                                        ),
                                      ]),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey, //color of divider
                    height: 25, //height spacing of divider
                    thickness: 1, //thickness of divier line
                    indent: 15, //spacing at the start of divider
                    endIndent: 15, //spacing at the end of divider
                  ),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 24,
                        height: 20,
                        child: Text(
                          'Synosis',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      Container(
                        width: MediaQuery.of(context).size.width - 24,
                        child: Text(
                          overview,
                          style: TextStyle(
                            fontSize: 13,
                            color: Color.fromARGB(255, 185, 184, 184),
                          ),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      Container(
                        width: MediaQuery.of(context).size.width - 24,
                        height: 20,
                        child: Text(
                          'Related Movies',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 15)),
                      Container(
                          width: MediaQuery.of(context).size.width - 24,
                          height: 147,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                list_movie(
                                    link_image: 'assets/image/Mulan.jpg',
                                    title: 'Mulan Maret 2020 (Indonesia)'),
                                Padding(padding: EdgeInsets.only(left: 16)),
                                list_movie(
                                    link_image:
                                        'assets/image/The Last Jedi.jpg',
                                    title: 'The Last Jedi  December  9,2017'),
                                Padding(padding: EdgeInsets.only(left: 16)),
                                list_movie(
                                    link_image:
                                        'assets/image/The-Rise-of-Skywalker.jpg',
                                    title: 'The Rise of Skywalker  2019'),
                                Padding(padding: EdgeInsets.only(left: 16)),
                                list_movie(
                                    link_image:
                                        'assets/image/TheForceAwakens-Poster.jpg',
                                    title: 'The Force Awakens 2015'),
                                Padding(padding: EdgeInsets.only(left: 16)),
                              ],
                            ),
                          ))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
