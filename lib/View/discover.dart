import 'package:flutter/material.dart';

import '../Widget/build_fantasy_list.dart';
import '../Widget/build_movies_list.dart';
import '../Widget/build_tv_series_list.dart';
import '../Widget/build_documentary_list.dart';

enum Category {
  movies,
  tvSeries,
  documentary,
  fantasy,
}

// ignore: must_be_immutable
class DiscoverScreen extends StatefulWidget {
  Category selectedCategory;
  DiscoverScreen({Key? key, this.selectedCategory = Category.movies})
      : super(key: key);

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Container(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Movies',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: (widget.selectedCategory ==
                                          Category.movies)
                                      ? Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .color
                                      : Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .color,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                          (widget.selectedCategory == Category.movies)
                              ? underlineSelectedCategory()
                              : Container(),
                        ],
                      ),
                      onPressed: () {
                        setState(() {
                          widget.selectedCategory = Category.movies;
                        });
                      }),
                  TextButton(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tv Series',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: (widget.selectedCategory ==
                                          Category.tvSeries)
                                      ? Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .color
                                      : Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .color,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                          (widget.selectedCategory == Category.tvSeries)
                              ? underlineSelectedCategory()
                              : Container(),
                        ],
                      ),
                      onPressed: () {
                        setState(() {
                          widget.selectedCategory = Category.tvSeries;
                        });
                      }),
                  TextButton(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Documentary',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: (widget.selectedCategory ==
                                          Category.documentary)
                                      ? Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .color
                                      : Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .color,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                          (widget.selectedCategory == Category.documentary)
                              ? underlineSelectedCategory()
                              : Container(),
                        ],
                      ),
                      onPressed: () {
                        setState(() {
                          widget.selectedCategory = Category.documentary;
                        });
                      }),
                  TextButton(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Fantasy',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color: (widget.selectedCategory ==
                                            Category.fantasy)
                                        ? Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .color
                                        : Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .color,
                                    fontWeight: FontWeight.normal),
                          ),
                          (widget.selectedCategory == Category.fantasy)
                              ? underlineSelectedCategory()
                              : Container(),
                        ],
                      ),
                      onPressed: () {
                        setState(() {
                          widget.selectedCategory = Category.fantasy;
                        });
                      }),
                ],
              ),
              (widget.selectedCategory == Category.movies)
                  ? SizedBox(
                      height: size.height / 1.25, child: const BuildMovieList())
                  : Container(),
              (widget.selectedCategory == Category.tvSeries)
                  ? SizedBox(
                      height: size.height / 1.25,
                      child: const BuildTvSeriesList())
                  : Container(),
              (widget.selectedCategory == Category.documentary)
                  ? SizedBox(
                      height: size.height / 1.25,
                      child: const BuildDocumentaryList())
                  : Container(),
              (widget.selectedCategory == Category.fantasy)
                  ? SizedBox(
                      height: size.height / 1.25,
                      child: const BuildFantasyList())
                  : Container(),
            ],
          ),
        ));
  }

  Widget underlineSelectedCategory() {
    return Container(
      width: 20,
      height: 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).textTheme.titleMedium!.color,
      ),
    );
  }
}
