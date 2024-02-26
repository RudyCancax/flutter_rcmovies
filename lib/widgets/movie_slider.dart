import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({super.key});

  @override
  Widget build(BuildContext context) {
    // final sizes = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: 200,
      color: Colors.amber,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(15),
            child: Text("Most popular",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => _MoviePoster(),
              itemCount: 20,
            ),
          )
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 100,
      color: Colors.black12,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    );
  }
}
