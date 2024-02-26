import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: sizes.height * 0.45,
      child: Swiper(
        itemCount: 5,
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
                child: const FadeInImage(
                  placeholder: AssetImage("assets/no-image.jpg"),
                  image: NetworkImage("https://via.placeholder.com/300x400"),
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
