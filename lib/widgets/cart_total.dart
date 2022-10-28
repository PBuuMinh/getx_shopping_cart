import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_shopping_cart/controllers/cart_controller.dart';

class CartTotal extends StatelessWidget {
  final CartController cartController = Get.find();
  CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 75),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Total',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${cartController.total ?? 0} VNĐ',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
