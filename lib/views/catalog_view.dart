import 'package:flutter/material.dart';
import 'package:getx_shopping_cart/views/cart_view.dart';
import 'package:getx_shopping_cart/widgets/catalog_products.dart';

class CatalogView extends StatelessWidget {
  const CatalogView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartView()),
              );
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: SafeArea(
        child: CatalogProducts(),
      ),
    );
  }
}
