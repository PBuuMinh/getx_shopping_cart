import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_shopping_cart/models/product_model.dart';
//import 'dart:developer' as devTools show log;

class CartController extends GetxController {
  final _products = {}.obs;

  void addProduct(Product product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;
    }
    Get.snackbar(
      "Product Added",
      "You have added the ${product.name} to the cart",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.white,
      duration: const Duration(seconds: 2),
    );
  }

  void removeAllProduct() {
    if (_products.isNotEmpty) {
      _products.clear();
    }
  }

  void removeProduct(Product product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product] -= 1;
    }
  }

  get products => _products;
  get productSubtotal => _products.entries
      .map((product) => product.key.price * product.value)
      .toList();
  get total {
    if (_products.isEmpty) {
      return 0;
    }
    return _products.entries
        .map((product) => product.key.price * product.value)
        .toList()
        .reduce((value, element) => value + element)
        .toString();
  }
}
