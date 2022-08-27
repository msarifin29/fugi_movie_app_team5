import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fugi_movie_app_team5/Controller/riverpod/detail_movie.dart';
import 'package:fugi_movie_app_team5/Widget/list_movie.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class DetailScreen extends ConsumerWidget {
  const DetailScreen({Key? key, required this.id}) : super(key: key);

  final int? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataDetail = ref.watch(detailFuture(id!));
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: dataDetail.when(
            data: (data) {
              print(data?.id);
              var banner =
                  'https://image.tmdb.org/t/p/w500${data!.backdropPath}';
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (data.backdropPath!.isEmpty)
                      SizedBox(
                        height: 250,
                        child: Image.asset(
                          'assets/image/movie',
                          fit: BoxFit.cover,
                        ),
                      )
                    else
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        child: Image.network(
                          banner,
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
                                  data.originalTitle.toString(),
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
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
                            // width: double.infinity,
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/icon/icon_star_outlined.png',
                                  color: const Color(0xffff8f71),
                                ),
                                Text(data.voteAverage!.toStringAsFixed(2),
                                    style:
                                        Theme.of(context).textTheme.bodyMedium)
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
                              SizedBox(
                                height: 30,
                                child: Text(
                                  DateFormat.yMMMd().format(data.releaseDate!),
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Genre',
                                  style:
                                      Theme.of(context).textTheme.titleLarge),
                              SizedBox(
                                height: 30,
                                width: MediaQuery.of(context).size.width / 1.7,
                                child: ListView.builder(
                                  itemCount: data.genres.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (ctx, i) => Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Container(
                                      height: 25,
                                      margin: const EdgeInsets.only(right: 5),
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
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
                                          ), //BoxShadow
                                        ],
                                      ),
                                      child: Center(
                                        child: Text(
                                          data.genres[i].name.toString(),
                                          style: const TextStyle(
                                              color: Color.fromARGB(
                                                  225, 240, 237, 237)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // Row(
                              //   children: [
                              //     for (var items in data.genres)
                              //       Padding(
                              //         padding: const EdgeInsets.only(left: 5),
                              //         child: Container(
                              //           width: double.infinity,
                              //           height: 25,
                              //           decoration: BoxDecoration(
                              //             borderRadius:
                              //                 BorderRadius.circular(20),
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
                              //           child: Center(
                              //             child: Text(
                              //               items.name.toString(),
                              //               style: const TextStyle(
                              //                   color: Color.fromARGB(
                              //                       225, 240, 237, 237)),
                              //             ),
                              //           ),
                              //         ),
                              //       ),
                              //   ],
                              // ),
                            ],
                          )
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
                        data.overview,
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
                                link_image:
                                    'assets/image/The-Rise-of-Skywalker.jpg',
                                title: 'The Rise of Skywalker  2019'),
                            const SizedBox(
                              width: 16,
                            ),
                            list_movie(
                                link_image:
                                    'assets/image/TheForceAwakens-Poster.jpg',
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
              );
            },
            error: (err, s) => Scaffold(
                  body: Text(
                    err.toString(),
                  ),
                ),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )));
  }
}
