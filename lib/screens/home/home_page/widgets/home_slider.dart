import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../data/demo_data.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          height: 200.0, autoPlay: true, viewportFraction: 0.9),
      items: DemoData.sliderImages.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(i)),
                  borderRadius: BorderRadius.circular(20)),
            );
          },
        );
      }).toList(),
    );
  }
}
