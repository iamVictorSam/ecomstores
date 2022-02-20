import 'package:ecomstore/controllers/cartController.dart';
import 'package:flutter/material.dart';
import 'package:ecomstore/screens/cart/cart_screen.dart';
import 'package:get/get.dart';

import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  HomeHeader({
    Key? key,
  }) : super(key: key);
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          // Obx(() => IconBtnWithCounter(
          //       numOfitem: cartController.cartCount,
          //       svgSrc: "assets/icons/Cart Icon.svg",
          //       press: () => Navigator.pushNamed(context, CartScreen.routeName),
          //     )),
          // IconBtnWithCounter(
          //   svgSrc: "assets/icons/Bell.svg",
          //   numOfitem: 3,
          //   press: () {},
          // ),
        ],
      ),
    );
  }
}
