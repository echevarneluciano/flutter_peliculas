import 'package:flutter/material.dart';
import 'package:flutter_peliculas/providers/movies_provider.dart';
import 'package:flutter_peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';
import '../search/search_delegate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MoviesProvider moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pelicualas en cine'),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => showSearch(
              context: context,
              delegate: MovieSearchDelegate(),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          CardSwiper(movies: moviesProvider.onDisplayMovies),
          MovieSlider(
            movies: moviesProvider.popularMovies,
            onNextPage: () => moviesProvider.getPopularMovies(),
          )
        ]),
      ),
    );
  }
}
