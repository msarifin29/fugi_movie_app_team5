import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fugi_movie_app_team5/Controller/riverpod/detail_movie.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class DetailTvScreen extends ConsumerWidget {
  const DetailTvScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataDetail = ref.watch(detailTvFuture(id!));
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: dataDetail.when(
            data: (data) {
              var banner =
                  'https://image.tmdb.org/t/p/w500${data!.backdropPath}';
              var name = data.name;
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    expandedHeight: 250.0,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Image.network(
                        banner,
                        fit: BoxFit.cover,
                        errorBuilder: (BuildContext context, Object object,
                            StackTrace? stackTrace) {
                          return Container(
                            color: Colors.black,
                          );
                        },
                      ),
                    ),
                    backgroundColor: Theme.of(context).backgroundColor,
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Container(
                          margin: const EdgeInsets.only(top: 15, left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Text(
                                      name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
                                            letterSpacing: 0,
                                          ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
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
                                          color: Color.fromARGB(
                                              225, 240, 237, 237),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              // SizedBox(
                              //   height: 30,
                              //   // width: double.infinity,
                              //   child: Row(
                              //     children: [
                              //       const Icon(
                              //         Icons.star,
                              //         color: Color(0xffff8f71),
                              //         size: 20,
                              //       ),
                              //       const SizedBox(
                              //         width: 5,
                              //       ),
                              //       Text(
                              //         data.voteAverage!.toString(),
                              //         style: Theme.of(context)
                              //             .textTheme
                              //             .bodyMedium!
                              //             .copyWith(
                              //                 fontWeight: FontWeight.bold),
                              //       ),
                              //     ],
                              //   ),
                              // ),
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
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Release date',
                                    style:
                                        Theme.of(context).textTheme.titleLarge!,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    DateFormat.yMMMd()
                                        .format(data.firstAirDate!),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Languages',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                      height: 30,
                                      width: MediaQuery.of(context).size.width /
                                          1.8,
                                      child: ListView.separated(
                                        itemCount: data.spokenLanguages!.length,
                                        scrollDirection: Axis.horizontal,
                                        separatorBuilder: (ctx, i) =>
                                            const SizedBox(
                                          width: 5,
                                        ),
                                        itemBuilder: (ctx, i) => Center(
                                          child: Text(
                                            '${data.spokenLanguages![i].name.toString()},',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Text('Genre',
                                  style:
                                      Theme.of(context).textTheme.titleLarge),
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                height: 30,
                                child: ListView.separated(
                                  itemCount: data.genres.length,
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder: (ctx, i) => const SizedBox(
                                    width: 5,
                                  ),
                                  itemBuilder: (ctx, i) => Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey.withOpacity(0.4),
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
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
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
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text('Synopsis',
                              style: Theme.of(context).textTheme.titleLarge),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            data.overview!,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontWeight: FontWeight.w400,
                                    wordSpacing: 1),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
