import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_shopping_cart/controllers/cart_controller.dart';
import 'package:getx_shopping_cart/widgets/cart_products.dart';
import 'package:getx_shopping_cart/widgets/cart_total.dart';

class CartView extends StatelessWidget {
  final CartController cartController = Get.find();
  CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        actions: [
          IconButton(
            onPressed: () {
              cartController.removeAllProduct();
            },
            icon: const Icon(Icons.remove_shopping_cart),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CartProducts(),
            CartTotal(),
          ],
        ),
      ),
    );
  }
}
