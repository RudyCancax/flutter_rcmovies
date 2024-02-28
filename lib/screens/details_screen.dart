import 'package:flutter/material.dart';
import 'package:flutter_rc_movies/models/models.dart';
import 'package:flutter_rc_movies/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(movie: movie),
        SliverList(
            delegate: SliverChildListDelegate([
          _PosterAndTitle(movie: movie),
          _Overview(movie: movie),
          CardCasting(movieID: movie.id.toString())
        ]))
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  final Movie movie;
  const _CustomAppBar({required this.movie});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.blue[900],
      expandedHeight: 200,
      floating: false,
      pinned: true,
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Container(
            color: Colors.black26,
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(bottom: 15),
            child: Text(
              movie.title,
              style: const TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            )),
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        background: FadeInImage(
          placeholder: const AssetImage("assets/loading.gif"),
          image: NetworkImage(movie.fullPosterImg),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Movie movie;

  const _PosterAndTitle({required this.movie});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          child: GestureDetector(
            onTap: () {
              showModal(context, movie.fullPosterImg);
            },
            child: FadeInImage(
                placeholder: const AssetImage('assets/loading.gif'),
                image: NetworkImage(movie.fullPosterImg),
                height: 180),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 150),
              child: Text(
                movie.title,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ),
            Text(
              movie.originalTitle,
              style: textTheme.titleMedium,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            Row(
              children: [
                Icon(
                  Icons.star_outline,
                  color: Colors.amber[800],
                ),
                Text(
                  movie.voteAverage.toString(),
                  style: textTheme.bodySmall,
                )
              ],
            )
          ],
        )
      ]),
    );
  }
}

class _Overview extends StatelessWidget {
  final Movie movie;
  const _Overview({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(movie.overview),
    );
  }
}

void showModal(BuildContext context, String image) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.zero, // Remove default padding
        content: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: SizedBox(
            width: double.infinity, // Ensure full width
            child: Stack(
              children: [
                FadeInImage(
                  placeholder: const AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(image),
                  fit: BoxFit.cover, // Ensure the image covers the entire area
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: IconButton(
                    icon: const Icon(Icons.close,
                        color: Colors.white, weight: 50),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
