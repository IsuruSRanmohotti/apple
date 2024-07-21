import 'package:apple/data/demo_data.dart';
import 'package:apple/models/product_model.dart';
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
          child: SingleChildScrollView(
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
                ),
                const SizedBox(
                  height: 15,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Latest Products',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  ),
                ),
                Divider(
                  color: Colors.grey.shade300,
                ),
                MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,childAspectRatio: 0.7,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2),
                    itemCount: DemoData.productList.length,
                    itemBuilder: (context, index) {
                      List<ProductModel> products = DemoData.productList;
                      return Container(
                        width: 100,
                        height: 150,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade700,
                            borderRadius: BorderRadius.circular(20)),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Image.network(products[index].image,width: 200,height: 150,)),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(products[index].name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                                          Container(
                                            padding: EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                              color: Colors.green,borderRadius: BorderRadius.circular(30)
                                            ),
                                            child: Text('LKR ${products[index].price.toInt()}/=',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))
                                        ],
                                      ),
                                    )),

                                    Align(alignment: Alignment.topRight,child: IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border,color: Colors.grey,)),)

                              ],),
                      );

                      // SizedBox(
                      //   width: 160,
                      //   height: 200,
                      //   child: Stack(
                      //     children: [
                      //       Align(
                      //         alignment: Alignment.bottomCenter,
                      //         child: Container(
                      //           width: 160,
                      //           height: 100,
                      //           decoration: BoxDecoration(
                      //               color: Colors.grey.shade800,
                      //               borderRadius: BorderRadius.circular(20)),
                      //         ),
                      //       ),
                      //       Align(
                      //         alignment: Alignment.center,
                      //         child: Image.network(products[index].image,height: 120,),
                      //       ),
                      //       Align(
                      //         alignment: Alignment.bottomCenter,
                      //         child: Padding(
                      //           padding: const EdgeInsets.all(8),
                      //           child: Text(
                      //             products[index].name,
                      //             style: const TextStyle(
                      //                 color: Colors.white,
                      //                 fontWeight: FontWeight.bold,
                      //                 fontSize: 18),
                      //           ),
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // );
                    },
                  ),
                )
              ],
            ),
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
