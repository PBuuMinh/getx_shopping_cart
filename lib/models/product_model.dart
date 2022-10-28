import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String name;
  final int price;
  final String imageUrl;
  const Product(
      {required this.name, required this.price, required this.imageUrl});

  static Product fromSnapshot(DocumentSnapshot snapshot) {
    Product product = Product(
      name: snapshot['name'],
      price: snapshot['price'],
      imageUrl: snapshot['imageUrl'],
    );
    return product;
  }

  // static const List<Product> products = [
  //   Product(
  //     name: 'Apple',
  //     price: 3000,
  //     imageUrl: 'https://vietvan.vn/wp-content/uploads/2022/07/apple-fruit.jpg',
  //   ),
  //   Product(
  //     name: 'Orange',
  //     price: 2000,
  //     imageUrl:
  //         'https://thumbs.dreamstime.com/b/orange-fruit-white-background-36051901.jpg',
  //   ),
  //   Product(
  //     name: 'Pear',
  //     price: 4000,
  //     imageUrl:
  //         'https://www.producemarketguide.com/sites/default/files/Commodities.tar/Commodities/pears_commodity-page.png',
  //   ),
  // ];
}
