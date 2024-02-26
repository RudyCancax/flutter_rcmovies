import 'package:flutter/material.dart';

class MovieDeatilsScreen extends StatelessWidget {
  const MovieDeatilsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
      // appBar: AppBar(title: const Text('MovieDeatils')),
      body: Center(
        child: Text(movie),
      ),
    );
  }
}
