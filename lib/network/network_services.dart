import 'package:tmdb_api/tmdb_api.dart';

class NetworkServices {
  final String apiKey = '12f2a8f01d4a7a2f124aef68567d9027';
  final String apiReadAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMmYyYThmMDFkNGE3YTJmMTI0YWVmNjg1NjdkOTAyNyIsInN1YiI6IjY0NzVkZmQ3OTI0Y2U2MDBmOTc2NTlmNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.8BParU6KzWvZtLci3JQnJ7FFfqU5TmTf6cCXyyYeKzg';

  void loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apiKey, apiReadAccessToken),
      logConfig: ConfigLogger(showLogs: true, showErrorLogs: true),
    );
    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    print(trendingResult);
  }
}
