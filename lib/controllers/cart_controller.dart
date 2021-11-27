import 'package:get/get.dart';
import '../models/product.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;
  // When u define get it becomes the property of that class
  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);
  int get count => cartItems.length;

  addToCart(Product product) {
    // return [...cartItems, product];
    cartItems.add(product);
  }
}
