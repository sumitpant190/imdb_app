// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../utils/text.dart';
import '../description_view.dart';

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
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Description(
                                name: topRated[index]['title'],
                                description: topRated[index]['overview'],
                                bannerUrl: 'https://image.tmdb.org/t/p/w500' +
                                    topRated[index]['backdrop_path'],
                                posterUrl: 'https://image.tmdb.org/t/p/w500' +
                                    topRated[index]['poster_path'],
                                vote:
                                    topRated[index]['vote_average'].toString(),
                                launched_on: topRated[index]['release_date'])));
                  },
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
