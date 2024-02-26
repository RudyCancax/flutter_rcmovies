import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  final String movieCategory;
  const MovieSlider({super.key, required this.movieCategory});

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
      height: 190,
      width: 130,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'details', arguments: 'Avatar2');
            },
            child: const ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: FadeInImage(
                placeholder: AssetImage("assets/no-image.jpg"),
                image: NetworkImage("https://via.placeholder.com/300x400"),
                height: 190,
                width: 130,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            "Enim sit exercitation ut occaecat elit.",
            style: TextStyle(fontWeight: FontWeight.w500),
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
