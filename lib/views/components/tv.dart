// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../utils/text.dart';
import '../description_view.dart';

class TV extends StatelessWidget {
  final List tv;
  const TV({
    Key? key,
    required this.tv,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ModifiedText(
          text: 'TV shows',
          size: 26,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 200,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tv.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Description(
                                    name: tv[index]['original_name'],
                                    description: tv[index]['overview'],
                                    bannerUrl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            tv[index]['backdrop_path'],
                                    posterUrl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            tv[index]['poster_path'],
                                    vote: tv[index]['vote_average'].toString(),
                                    launched_on: tv[index]['first_air_date'])));
                      },
                      child: tv[index]['backdrop_path'] != null
                          ? Container(
                              width: 250,
                              child: Column(
                                children: [
                                  Container(
                                    width: 250,
                                    height: 140,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                'https://image.tmdb.org/t/p/w500' +
                                                    tv[index]['poster_path']))),
                                  ),
                                  Container(
                                    child: ModifiedText(
                                        text: tv[index]['original_name'] != null
                                            ? tv[index]['original_name']
                                            : 'loading'),
                                  )
                                ],
                              ),
                            )
                          : Container()),
                );
              }),
        )
      ]),
    );
  }
}
