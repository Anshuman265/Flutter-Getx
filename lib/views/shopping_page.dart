import 'package:flutter/material.dart';
import 'package:flutter_getx/controllers/cart_controller.dart';
import 'package:flutter_getx/controllers/shopping_controller.dart';
import 'package:get/get.dart';
import '../models/product.dart';

class ShoppingPage extends StatelessWidget {
  // The dependency injection
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());
  // Use get.find() to search for this controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Page'),
      ),
      body: SafeArea(
        child: Column(children: [
          Expanded(
            child: GetX<ShoppingController>(
              builder: (controller) {
                return ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.all(12),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.products[index].productName,
                                      style: const TextStyle(fontSize: 24),
                                    ),
                                    Text(
                                      controller
                                          .products[index].productDescription,
                                    ),
                                  ],
                                ),
                                Text(
                                  '\$${controller.products[index].price}',
                                  style: const TextStyle(fontSize: 24),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                cartController
                                    .addToCart(controller.products[index]);
                              },
                              child: const Text('Add to Cart!'),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.green[300]),
                                textStyle: MaterialStateProperty.all(
                                  const TextStyle(fontSize: 15),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          GetX<CartController>(builder: (controller) {
            return Text(
              'Total amount: \$ ${controller.totalPrice}',
              style: TextStyle(
                fontSize: 20,
              ),
            );
          }),
          const SizedBox(
            height: 100,
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: GetX<CartController>(builder: (controller) {
          return Text(controller.count.toString());
        }),
        icon: Icon(
          Icons.shopping_cart_rounded,
        ),
        backgroundColor: Colors.black54,
      ),
    );
  }
}
