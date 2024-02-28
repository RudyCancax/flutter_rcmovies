import 'package:flutter/cupertino.dart';
import 'package:flutter_rc_movies/models/models.dart';
import 'package:flutter_rc_movies/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class CardCasting extends StatelessWidget {
  final String movieID;
  const CardCasting({super.key, required this.movieID});

  @override
  Widget build(BuildContext context) {
    final moviewProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
        future: moviewProvider.getCrewMovie(movieID),
        builder: (_, snapshot) {
          if (!snapshot.hasData) {
            return Container(
              constraints: const BoxConstraints(maxWidth: 15),
              height: 180,
              child: const CupertinoActivityIndicator(),
            );
          }

          final List<Cast> cast = snapshot.data!;

          return SizedBox(
              width: double.infinity,
              height: 180,
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) => _CastCard(crew: cast[index]),
              ));
        });
  }
}

class _CastCard extends StatelessWidget {
  final Cast crew;

  const _CastCard({required this.crew});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 70,
      height: 50,
      child: Column(
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Column(
                children: [
                  if (crew.fullCastImg == null)
                    const FadeInImage(
                        placeholder: AssetImage('assets/no-image.jpg'),
                        image: AssetImage('assets/no-image.jpg'))
                  else
                    FadeInImage(
                        placeholder: const AssetImage('assets/no-image.jpg'),
                        image: NetworkImage(crew.fullCastImg)),
                ],
              )),
          const SizedBox(
            height: 5,
          ),
          Text(
            crew.name,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
