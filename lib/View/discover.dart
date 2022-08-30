import 'package:flutter/material.dart';
import 'package:fugi_movie_app_team5/Widget/build_movies_search_list.dart';

import '../Widget/build_fantasy_list.dart';
import '../Widget/build_movies_list.dart';
import '../Widget/build_tv_series_list.dart';
import '../Widget/build_documentary_list.dart';

enum Category {
  movies,
  tvSeries,
  documentary,
  fantasy,
  search,
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
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 24),
              Container(
                width: size.width * 85 / 100,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                alignment: Alignment.center,
                child: Row(
                  children: const [
                    Flexible(
                      child: Text(
                        'Find Movie, Tv Series, and more..',
                        style: TextStyle(fontSize: 28),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 14, bottom: 10),
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                width: 85 * size.width / 100,
                decoration: BoxDecoration(
                    color: const Color(0xFF211F30),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.only(bottom: 4),
                    hintText: "Search Movie",
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF939393),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      widget.selectedCategory = Category.search;
                    });
                  },
                ),
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
                  ? const Expanded(child: BuildMovieList())
                  : Container(),
              (widget.selectedCategory == Category.tvSeries)
                  ? const Expanded(child: BuildTvSeriesList())
                  : Container(),
              (widget.selectedCategory == Category.documentary)
                  ? const Expanded(child: BuildDocumentaryList())
                  : Container(),
              (widget.selectedCategory == Category.fantasy)
                  ? const Expanded(child: BuildFantasyList())
                  : Container(),
              (widget.selectedCategory == Category.search &&
                      searchController.text.isNotEmpty)
                  ? Expanded(
                      child: BuildMovieSearchList(
                      keyword: searchController.text,
                    ))
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
