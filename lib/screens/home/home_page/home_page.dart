import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widgets/custom_app_bar.dart';
import 'widgets/home_row.dart';
import 'widgets/home_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Container(
        width: size.width * 0.6,
        height: size.height,
        color: Colors.grey.shade700,
        child: const Column(
          children: [FaIcon(FontAwesomeIcons.apple)],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            children: [
              const CustomAppBar(),
              const SizedBox(
                height: 10,
              ),
              const HomeSlider(),
              const SizedBox(
                height: 10,
              ),
              const HomeRow(),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Top Categories',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
              ),
              Divider(
                color: Colors.grey.shade300,
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  children: [
                    CategoryView(
                      image: 'assets/images/iphone.png',
                      name: 'i Phones',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CategoryView(
                      image: 'assets/images/ipad.png',
                      name: 'i Pads',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CategoryView(
                      image: 'assets/images/mac.png',
                      name: 'Mac',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CategoryView(
                      image: 'assets/images/watch.png',
                      name: 'i Watch',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CategoryView(
                      image: 'assets/images/airpods.png',
                      name: 'Air Pods',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.image, required this.name});

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      height: 200,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 160,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset(image),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                name,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }
}
