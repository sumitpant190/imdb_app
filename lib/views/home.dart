import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/home_view_model.dart';
import 'home_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, viewModel, _) => HomeView(
        trendingMovies: viewModel.trendingMovies,
        topRatedMovies: viewModel.topRatedMovies,
        tv: viewModel.tv,
      ),
    );
  }
}
