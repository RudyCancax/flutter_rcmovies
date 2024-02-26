import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return const Scaffold(
        body: CustomScrollView(
      slivers: [_CustomAppBar()],
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
