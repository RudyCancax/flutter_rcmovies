import 'package:flutter/material.dart';
import 'package:flutter_rc_movies/models/models.dart';

class MovieSlider extends StatelessWidget {
  final List<Movie> mostPopularMovies;
  final String movieCategory;

  const MovieSlider(
      {super.key,
      required this.movieCategory,
      required this.mostPopularMovies});

  @override
  Widget build(BuildContext context) {
    // final sizes = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: 270,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 10),
            child: Text(movieCategory,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                )),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) =>
                  _MoviePoster(movie: mostPopularMovies[index]),
              itemCount: mostPopularMovies.length,
            ),
          )
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final Movie movie;

  const _MoviePoster({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: 130,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'details', arguments: movie);
            },
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: FadeInImage(
                placeholder: const AssetImage("assets/no-image.jpg"),
                image: NetworkImage(movie.fullPosterImg),
                height: 190,
                width: 130,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            movie.title,
            style: const TextStyle(fontWeight: FontWeight.w500),
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
