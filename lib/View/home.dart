import 'package:flutter/material.dart';
import 'package:fugi_movie_app_team5/View/discover.dart';

import 'trendingScreen/trending_movie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ignore: unused_field
  final List<Widget> _screen = [
    const TrendingMovieScreen(),
    DiscoverScreen(),
    Container(alignment: Alignment.center, child: const Text('account'))
  ];

  // ignore: prefer_final_fields, unused_field
  int _selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Row(
        children: [
          Expanded(
            child: _screen[_selectIndex],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: const Color(0xffff8f71),
        iconSize: 26,
        selectedFontSize: 20,
        unselectedFontSize: 18,
        backgroundColor: Theme.of(context).backgroundColor,
        onTap: (int index) {
          setState(() {
            _selectIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'account'),
        ],
      ),
    );
  }
}
