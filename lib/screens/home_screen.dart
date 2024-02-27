import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rc_movies/providers/movies_provider.dart';
import 'package:flutter_rc_movies/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    print(moviesProvider.displayingMovies);

    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Movies')),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CardSwiper(movies: moviesProvider.displayingMovies),
              const MovieSlider(movieCategory: "Most Populars"),
            ],
          ),
        ));
  }
}
