// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/text.dart';

class Description extends StatelessWidget {
  final String name, description, bannerUrl, posterUrl, vote, launched_on;

  const Description(
      {super.key,
      required this.name,
      required this.description,
      required this.bannerUrl,
      required this.posterUrl,
      required this.vote,
      required this.launched_on});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                      child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(bannerUrl, fit: BoxFit.cover),
                  )),
                  Positioned(
                      bottom: 12,
                      child: ModifiedText(
                        text: '⭐ Average rating - ' + vote,
                        size: 16,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: ModifiedText(
                text: name != null ? name : 'Not loaded',
                size: 22,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: ModifiedText(
                text: 'Releasing on - ' + launched_on,
                size: 14,
              ),
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(right: 4),
                  height: 200,
                  width: 100,
                  child: Image.network(posterUrl),
                ),
                Flexible(
                  child: Container(
                    child: ModifiedText(
                      text: description,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
