import 'package:flutter/material.dart';
import 'package:flutter_rc_movies/widgets/card_swiper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Movies')),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded))
          ],
        ),
        body: const Column(
          children: [
            CardSwiperScreen(),
          ],
        ));
  }
}
