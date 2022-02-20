import 'package:ecomstore/components/coustom_bottom_nav_bar.dart';
import 'package:ecomstore/components/default_button.dart';
import 'package:ecomstore/components/product_card.dart';
import 'package:ecomstore/data_layer/models/all_products.dart';
import 'package:ecomstore/data_layer/models/cate_products.dart';
import 'package:ecomstore/enums.dart';
import 'package:ecomstore/screens/cateScreen/components/view_cate_prodcard.dart';
import 'package:ecomstore/screens/home/components/home_header.dart';
import 'package:ecomstore/screens/order_details.dart';
import 'package:ecomstore/screens/seeAllPopular/seeAllPopular.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../controllers/cateProdController.dart';
import '../../size_config.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({
    Key? key,
  }) : super(key: key);

  // final AllProducts micate;

  // final GetAllCatProductsController cateController =
  //     Get.put(GetAllCatProductsController());

  @override
  Widget build(BuildContext context) {
    final cateProductController = Get.put(GetAllCatProductsController());
    return Scaffold(
      bottomNavigationBar:
          CustomBottomNavBar(selectedMenu: MenuState.favourite),
      // bottomNavigationBar:
      //     CustomBottomNavBar(selectedMenu: MenuState.favourite),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenHeight(20)),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(10),
                    vertical: getProportionateScreenHeight(10)),
                child: Obx(() {
                  return Container(
                    child: cateProductController.isLoading.value
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : GridView.builder(
                            // controller: productController.scrollController,
                            itemCount:
                                cateProductController.getAllProducts.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 15,
                              childAspectRatio: 0.7,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: ProductCard(
                                    product: cateProductController
                                        .getAllProducts[index],
                                  ),
                                ),
                              );
                            },
                          ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
