import 'package:ecomstore/controllers/allProductController.dart';
import 'package:ecomstore/screens/seeAllPopular/seeAllPopular.dart';
import 'package:flutter/material.dart';
import 'package:ecomstore/components/product_card.dart';
import 'package:ecomstore/models/Product.dart';
import 'package:get/get.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  final reportsController = Get.put(
    GetAllProductsController(),
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: SectionTitle(
                title: "Popular Products",
                press: () => Get.to(SeeAllPopular())),
          ),
          SizedBox(height: getProportionateScreenWidth(20)),
          Obx(
            () => Container(
                width: double.infinity,
                child: reportsController.isLoading.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        // controller: productController.scrollController,
                        itemCount: reportsController.getAllProducts.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.8,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: ProductCard(
                                product:
                                    reportsController.getAllProducts[index],
                              ),
                            ),
                          );
                        })),

            // : Container(
            //     width: double.infinity,
            //     child: Row(
            //       children: [
            //         ...List.generate(
            //           reportsController.getAllProducts.length,
            //           (index) {
            //             return ProductCard(
            //                 product:
            //                     reportsController.getAllProducts[index]);

            //             // return SizedBox
            //             //     .shrink(); // here by default width and height is 0
            //           },
            //         ),
            //         SizedBox(width: getProportionateScreenWidth(20)),
            //       ],
            //     ),
            //   ),
            // ),
          ),
        ],
      ),
    );
  }
}
