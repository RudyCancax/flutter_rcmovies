import 'package:flutter/material.dart';
import 'package:flutter_rc_movies/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        const _CustomAppBar(),
        SliverList(
            delegate: SliverChildListDelegate([
          const _PosterAndTitle(),
          const _Overview(),
          const CardCasting()
        ]))
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar();

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
            child: const Text("movie.title",
                style: TextStyle(color: Colors.white))),
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        background: const FadeInImage(
          placeholder: AssetImage("assets/loading.gif"),
          image: NetworkImage("https://via.placeholder.com/500x300"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        const ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          child: FadeInImage(
              placeholder: AssetImage('assets/loading.gif'),
              image: NetworkImage("https://via.placeholder.com/200x300"),
              height: 200),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'movie.title',
              style: textTheme.headlineSmall,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            Text(
              'movie.originaltitle',
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
                  'movie.voteAverage',
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
  const _Overview();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: const Text(
          "Sit commodo et officia sint dolor elit Lorem cillum officia ullamco. Aliquip aliquip commodo Lorem ipsum laborum adipisicing occaecat. Et eiusmod do consequat enim mollit mollit tempor mollit magna ut voluptate eiusmod. Tempor sit do labore reprehenderit tempor laborum velit voluptate tempor sit. Reprehenderit consequat exercitation dolor consequat anim non. Culpa ullamco labore aliquip ut anim dolore. Enim non incididunt eiusmod nostrud veniam proident et ad esse laboris sint exercitation dolor minim. Non commodo laboris culpa consequat labore nulla excepteur in.Cupidatat nostrud labore ex ipsum consequat. Et duis labore exercitation occaecat."),
    );
  }
}
