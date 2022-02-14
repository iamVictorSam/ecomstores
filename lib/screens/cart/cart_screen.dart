import 'package:flutter/material.dart';
import 'package:ecomstore/models/Cart.dart';
import 'package:get/get.dart';

import '../../controllers/cartController.dart';
import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatelessWidget {
  final cartController = Get.put(CartController());

  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Obx(() => Column(
            children: [
              Text(
                "Your Cart",
                style: TextStyle(color: Colors.black),
              ),
              Text(
                "${cartController.cartCount} items",
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          )),
    );
  }
}
