import 'package:flutter_getx/models/product.dart';
import 'package:get/get.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    //Fetch the products
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(const Duration(seconds: 1));
    var serverResponse = [
      Product(
        id: 1,
        productName: 'First Prod',
        productImage: 'abd',
        productDescription: 'some description about the product',
        price: 30,
      ),
      Product(
        id: 2,
        productName: 'Second Prod',
        productImage: 'abd',
        productDescription: 'some description about the product',
        price: 40,
      ),
      Product(
        id: 3,
        productName: 'Third Prod',
        productImage: 'abd',
        productDescription: 'some description about the product',
        price: 45,
      ),
      Product(
        id: 4,
        productName: 'Fourth Prod',
        productImage: 'abd',
        productDescription: 'some description about the product',
        price: 55,
      ),
    ];
    products.value = serverResponse;
  }
}
