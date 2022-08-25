import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class list_movie extends StatelessWidget {
  final String link_image;
  final String title;

  list_movie(
      {required this.link_image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 142,
      height: 146,
      child: Stack(
        children: [
          Container(
            width: 142,
            height: 105,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: new DecorationImage(
                  image: new AssetImage(link_image),
                  fit: BoxFit.cover
                )),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(
              width: 142,
              height: 40,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 185, 184, 184),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),
            ),
          ])
        ],
      ),
    );
  }
}
