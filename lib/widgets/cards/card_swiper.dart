import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_rc_movies/models/models.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;

  const CardSwiper({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: sizes.height * 0.45,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: sizes.width * 0.6,
        itemHeight: sizes.height * 0.45,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 5),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'details');
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: FadeInImage(
                  placeholder: const AssetImage("assets/no-image.jpg"),
                  image: NetworkImage(
                      "https://image.tmdb.org/t/p/w500/${movies[index].posterPath}"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
