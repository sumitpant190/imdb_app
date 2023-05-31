// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../utils/text.dart';

class TopRated extends StatelessWidget {
  final List topRated;
  const TopRated({
    Key? key,
    required this.topRated,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ModifiedText(text: 'Top Rated Movies', size: 26),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 270,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: topRated.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          topRated[index]['poster_path']))),
                        ),
                        Container(
                          child: ModifiedText(
                              text: topRated[index]['title'] != null
                                  ? topRated[index]['title']
                                  : 'loading'),
                        )
                      ],
                    ),
                  ),
                );
              }),
        )
      ]),
    );
  }
}
