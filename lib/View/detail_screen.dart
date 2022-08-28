import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fugi_movie_app_team5/Widget/list_movie.dart';

class detail_screen extends StatefulWidget {
  const detail_screen({Key? key}) : super(key: key);

  @override
  State<detail_screen> createState() => _detail_screenState();
}

class _detail_screenState extends State<detail_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(21, 20, 31, 100),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 287,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                image: new DecorationImage(
                    image: new AssetImage('assets/image/The Last Jedi.jpg'),
                    fit: BoxFit.cover),
              ),
              child: Center(
                child: Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    image: new DecorationImage(
                        image: new AssetImage(
                            'assets/icon/icon_play_outlined.png'),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 24,
                    height: 50,
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Star Wars: The Last Jedi',
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                          Padding(padding: EdgeInsets.only(left: 30)),
                          Container(
                            width: 29,
                            height: 22,
                            child: Center(
                              child: Text(
                                '47K',
                                style: TextStyle(
                                    color: Color.fromARGB(225, 240, 237, 237)),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
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
                          )
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: 5)),
                      Row(
                        children: [
                          new Container(
                            width: 181,
                            height: 15,
                            child: Row(
                              children: [
                                Image(
                                    image: AssetImage(
                                        'assets/icon/icon_time.png')),
                                Text(
                                  '152 minutes',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 185, 184, 184),
                                      fontSize: 13),
                                ),
                                Padding(padding: EdgeInsets.only(left: 10)),
                                Image(
                                    image: AssetImage(
                                        'assets/icon/icon_star_outlined.png')),
                                Text(
                                  '7.0 (IMDb)',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 185, 184, 184),
                                      fontSize: 13),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ]),
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
                          children: const [
                            Text(
                              'Release date',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'December 9,2017',
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
                        height: 65,
                        child: Text(
                          'Reh (Deisy Ridley) finally manages to find the legendary jedi knight,Luke Skywalker (Mark Hamill) on an island with a magical aura. The heroes of The Force Awakens including leia.Finnb Read more.',
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
