// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:imdb_app/utils/text.dart';
import 'package:imdb_app/utils/utils.dart';
import 'package:imdb_app/view_model/auth_view_model.dart';
import 'components/top_rated.dart';
import 'components/trending.dart';
import 'components/tv.dart';

class HomeView extends StatelessWidget {
  final List trendingMovies;
  final List topRatedMovies;
  final List tv;
  const HomeView({
    Key? key,
    required this.trendingMovies,
    required this.topRatedMovies,
    required this.tv,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authViewModel = AuthViewModel();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: ModifiedText(text: 'Movie App'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8, top: 20),
            child: InkWell(
              onTap: () {
                authViewModel.signOut(context);
              },
              child: ModifiedText(text: 'Log Out'),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          TV(tv: tv),
          TopRated(topRated: topRatedMovies),
          TrendingMovies(trendingMovies: trendingMovies),
        ],
      ),
    );
  }
}
