import 'package:ecomstore/components/coustom_bottom_nav_bar.dart';
import 'package:ecomstore/components/product_card.dart';
import 'package:ecomstore/controllers/allProductController.dart';
import 'package:ecomstore/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../enums.dart';
import '../home/components/home_header.dart';

class SeeAllPopular extends StatelessWidget {
  final productController = Get.put(GetAllProductsController());

  @override
  Widget build(BuildContext context) {
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
                    child: productController.isLoading.value
                        ? Center(
                            child: Image.asset(
                              "assets/icons/Hourglass.gif",
                              height: 125.0,
                              width: 125.0,
                            ),
                          )
                        : GridView.builder(
                            // controller: productController.scrollController,
                            itemCount: productController.getAllProducts.length,
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
                                    product:
                                        productController.getAllProducts[index],
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
// Obx(() {
//           if (productController.isMoreDataAvailable.value)
//             return Center(child: CircularProgressIndicator());
//           else
//             return Container(
//               height: 300,
//               child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   controller: productController.scrollController,
//                   itemCount: productController.products.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     if (index == productController.products.length - 1 &&
//                         productController.isMoreDataAvailable.value == true) {
//                       return CircularProgressIndicator();
//                     }
//                     return Row(
//                       children: [
//                         ...List.generate(
//                           productController.products.length,
//                           (index) {
//                             // if (demoProducts[index].isPopular)
//                             return ProductCard(
//                                 product: productController.products[index]);

//                             // return SizedBox
//                             //     .shrink(); // here by default width and height is 0
//                           },
//                         ),
//                         SizedBox(width: getProportionateScreenWidth(20)),
//                       ],
//                     );
//                   }),
//             );
//         })
