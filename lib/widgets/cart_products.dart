import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_shopping_cart/controllers/cart_controller.dart';
import 'package:getx_shopping_cart/models/product_model.dart';

class CartProducts extends StatelessWidget {
  final CartController cartController = Get.find();
  CartProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 530,
        child: ListView.builder(
          itemCount: cartController.products.length,
          itemBuilder: (context, index) {
            return CartProductCard(
              cartController: cartController,
              product: cartController.products.keys.toList()[index],
              quantity: cartController.products.values.toList()[index],
              index: index,
            );
          },
        ),
      ),
    );
  }
}

class CartProductCard extends StatelessWidget {
  final CartController cartController;
  final Product product;
  final int quantity;
  final int index;

  const CartProductCard({
    required this.cartController,
    required this.product,
    required this.quantity,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
              product.imageUrl,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(product.name),
          ),
          IconButton(
            onPressed: () {
              cartController.removeProduct(product);
            },
            icon: const Icon(Icons.remove_circle),
          ),
          Text('$quantity'),
          IconButton(
            onPressed: () {
              cartController.addProduct(product);
            },
            icon: const Icon(Icons.add_circle),
          ),
        ],
      ),
    );
  }
}
