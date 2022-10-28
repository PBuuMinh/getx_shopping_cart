import 'package:get/get.dart';
import 'package:getx_shopping_cart/models/product_model.dart';
import 'package:getx_shopping_cart/services/firestore_db.dart';

class ProductController extends GetxController {
  final products = <Product>[].obs;

  @override
  void onInit() {
    products.bindStream(FirestoreDB().getAllProducts());
    super.onInit();
  }
}
