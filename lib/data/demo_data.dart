import '../models/product_model.dart';

class DemoData {
  static List<String> sliderImages = [
    'https://media.cnn.com/api/v1/images/stellar/prod/ios-17-review-lead-cnnu.jpg?c=16x9',
    'https://www.apple.com/v/ios/ios-17/a/images/meta/ios-17__ni2koxyri7m2_og.png',
    'https://www.livemint.com/lm-img/img/2023/09/18/600x338/ios_17_1685986638198_1695016956548.png',
    'https://sempreupdate.com.br/wp-content/uploads/2023/10/ios-17-1-promete-mudancas-emocionantes-para-o-seu-iphone-860x484.jpg',
  ];

  static List<ProductModel> productList = [
    ProductModel(name: 'MacBook Air M2', image: 'https://firebasestorage.googleapis.com/v0/b/apple-ecommerce0.appspot.com/o/Product%20Images%2FMac%2Fair%20m2%20pro.png?alt=media&token=7e86157b-651d-48cd-8de4-5b6138fb1cf4', price: 325000, description: 'description',),
    ProductModel(name: 'MacBook Air M3', image: 'https://firebasestorage.googleapis.com/v0/b/apple-ecommerce0.appspot.com/o/Product%20Images%2FMac%2Fair%20m2.png?alt=media&token=003529b4-f655-4ac9-aea6-72542d9a495f', price: 423000, description: 'description'),
    ProductModel(name: 'I Pd 1st Gen', image: 'https://firebasestorage.googleapis.com/v0/b/apple-ecommerce0.appspot.com/o/Product%20Images%2Fi%20Pad%2F1stgen.png?alt=media&token=a30c35bd-d5c6-4459-bad4-ddd35211c721', price: 125000, description: 'description'),
    ProductModel(name: 'I Pad 7th Gen', image: 'https://firebasestorage.googleapis.com/v0/b/apple-ecommerce0.appspot.com/o/Product%20Images%2Fi%20Pad%2F7th%20gen.png?alt=media&token=334d3273-fc8f-48a2-8b77-a1c51b8fd32d', price: 185000, description: 'description'),
    ProductModel(name: '11 Pro Max', image: 'https://firebasestorage.googleapis.com/v0/b/apple-ecommerce0.appspot.com/o/Product%20Images%2Fi%20Phone%2F11%20pro.png?alt=media&token=ea080467-2839-400b-bb2f-88a54e244cb7', price: 225000, description: 'description')
  ];
}
