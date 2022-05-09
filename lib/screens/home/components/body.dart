import 'package:ecomstore/controllers/categoriesController.dart';
import 'package:ecomstore/data_layer/wallet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  final cateController = Get.put(GetAllCategoriesController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => SafeArea(
          child: cateController.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: getProportionateScreenHeight(20)),
                      HomeHeader(),
                      SizedBox(height: getProportionateScreenWidth(10)),
                      DiscountBanner(),
                      // Categories(),
                      SpecialOffers(),
                      SizedBox(height: getProportionateScreenWidth(30)),
                      PopularProducts(),
                      SizedBox(height: getProportionateScreenWidth(30)),
                    ],
                  ),
                ),
        ));
  }
}
