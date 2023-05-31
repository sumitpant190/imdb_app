import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomeViewModel extends ChangeNotifier {
  List trendingMovies = [];
  List topRatedMovies = [];
  List tv = [];

  final String apiKey = '12f2a8f01d4a7a2f124aef68567d9027';
  final String readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMmYyYThmMDFkNGE3YTJmMTI0YWVmNjg1NjdkOTAyNyIsInN1YiI6IjY0NzVkZmQ3OTI0Y2U2MDBmOTc2NTlmNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.8BParU6KzWvZtLci3JQnJ7FFfqU5TmTf6cCXyyYeKzg';

  HomeViewModel() {
    loadMovies();
  }

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apiKey, readAccessToken),
      logConfig: ConfigLogger(showLogs: true, showErrorLogs: true),
    );
    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvResult = await tmdbWithCustomLogs.v3.tv.getPopular();

    trendingMovies = trendingResult['results'];
    topRatedMovies = topRatedResult['results'];
    tv = tvResult['results'];
    print('printing tv');
    print(tv);

    notifyListeners();
  }
}
