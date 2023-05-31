// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../utils/text.dart';
import '../description_view.dart';

class TrendingMovies extends StatelessWidget {
  final List trendingMovies;
  const TrendingMovies({
    Key? key,
    required this.trendingMovies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ModifiedText(text: 'Trending Movies', size: 26),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 270,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trendingMovies.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                  name: trendingMovies[index]['title'],
                                  description: trendingMovies[index]
                                      ['overview'],
                                  bannerUrl: 'https://image.tmdb.org/t/p/w500' +
                                      trendingMovies[index]['backdrop_path'],
                                  posterUrl: 'https://image.tmdb.org/t/p/w500' +
                                      trendingMovies[index]['poster_path'],
                                  vote: trendingMovies[index]['vote_average']
                                      .toString(),
                                  launched_on: trendingMovies[index]
                                      ['release_date'])));
                    },
                    child: trendingMovies[index]['title'] != null
                        ? Container(
                            width: 140,
                            child: Column(
                              children: [
                                Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'https://image.tmdb.org/t/p/w500' +
                                                  trendingMovies[index]
                                                      ['poster_path']))),
                                ),
                                Container(
                                  child: ModifiedText(
                                      text:
                                          trendingMovies[index]['title'] != null
                                              ? trendingMovies[index]['title']
                                              : 'loading'),
                                )
                              ],
                            ),
                          )
                        : Container());
              }),
        )
      ]),
    );
  }
}
