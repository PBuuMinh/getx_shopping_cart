import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_shopping_cart/controllers/product_controller.dart';
import 'package:getx_shopping_cart/controllers/cart_controller.dart';

class CatalogProducts extends StatelessWidget {
  final productController = Get.put(ProductController());
  CatalogProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: productController.products.length,
        itemBuilder: (BuildContext context, int index) {
          return CatalogProductCart(index: index);
        },
      ),
    );
  }
}

class CatalogProductCart extends StatelessWidget {
  final cartController = Get.put(CartController());
  final ProductController productController = Get.find();
  final int index;
  CatalogProductCart({
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
              productController.products[index].imageUrl,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          // Product Name
          Expanded(
            child: Text(
              productController.products[index].name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          //Product Price
          Expanded(
              child: Text('${productController.products[index].price} VNĐ')),
          IconButton(
            onPressed: () {
              cartController.addProduct(productController.products[index]);
            },
            icon: const Icon(Icons.add_circle),
          ),
        ],
      ),
    );
  }
}
