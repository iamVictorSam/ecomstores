import 'package:ecomstore/controllers/cartController.dart';
import 'package:ecomstore/data_layer/models/all_products.dart';
import 'package:flutter/material.dart';
import 'package:ecomstore/components/default_button.dart';
import 'package:ecomstore/models/Product.dart';
import 'package:ecomstore/size_config.dart';
import 'package:get/get.dart';

import 'color_dots.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatelessWidget {
  final cartController = Get.put(CartController());

  final AllProducts product;

  Body({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(product: product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: product,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                // color: Color(0xFFF6F7F9),
                color: Colors.transparent,
                child: Column(
                  children: [
                    // ColorDots(product: product),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: DefaultButton(
                          text: "Add To Cart",
                          press: () {
                            Get.snackbar('Item Added', '',
                                messageText: Center(
                                    child: Text('Item added',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold))),
                                colorText: Colors.white,
                                backgroundColor: Colors.black,
                                snackPosition: SnackPosition.BOTTOM);
                            // postTest();
                            cartController.addToCart(product);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
