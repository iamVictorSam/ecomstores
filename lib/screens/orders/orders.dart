// ignore_for_file: prefer_is_empty, prefer_const_constructors

import 'dart:ui';

import 'package:ecomstore/components/default_button.dart';
import 'package:ecomstore/controllers/orderDetailsController.dart';
import 'package:ecomstore/screens/home/home_screen.dart';
import 'package:ecomstore/screens/order_details.dart';
import 'package:ecomstore/screens/orders/components/order_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Orders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GetOrderDetailsController rOdersController =
        Get.put(GetOrderDetailsController());
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Color(0xffF5F5F5),
        appBar: AppBar(
          title: Text(
            'My Orders',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            GestureDetector(
              onTap: () => Get.offAll(HomeScreen()),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Text(
                    'Home',
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(child: Container(child: Obx(() {
          if (rOdersController.isLoading.value)
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.35),
                Center(child: CircularProgressIndicator()),
              ],
            );
          else
            // ignore: curly_braces_in_flow_control_structures
            return rOdersController.getOrders.length == 0
                ? Column(
                    children: [
                      Text(
                        'No Order here',
                        style: TextStyle(fontSize: 30, color: kPrimaryColor),
                      ),
                      // ignore: sized_box_for_whitespace
                      Container(
                        height: getProportionateScreenHeight(300),
                        width: getProportionateScreenWidth(400),
                        child: Image.network('https://i.imgur.com/kl9X3Gn.png'),
                      ),
                      SizedBox(height: 50),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(20)),
                        child: DefaultButton(
                            // press: () => Get.to(() => SeeAll()),
                            press: () {},
                            text: 'Shop Now'),
                      )
                    ],
                  )
                : Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      ...List.generate(
                        rOdersController.getOrders.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: OrderCard(
                            orderCode:
                                rOdersController.getOrders[index].orderKey,
                            orderStatus:
                                rOdersController.getOrders[index].status,
                            time: 'January 22, 2021',
                            price: rOdersController.getOrders[index].total,
                            onPressed: () {
                              Get.to(() => OrderDetails(
                                    retrieveOrder:
                                        rOdersController.getOrders[index],
                                  ));
                            },
                          ),
                        ),
                      )

                      //      SingleChildScrollView(
                      //   scrollDirection: Axis.horizontal,
                      //   child: Obx(() {
                      //     if (cateController.isLoading.value)
                      //       return CircularProgressIndicator();
                      //     else
                      //       return Row(
                      //         children: [
                      //           ...List.generate(cateController.categories.length, (index) {
                      //             return SpecialOfferCard(
                      //               category: cateController.categories[index].name,
                      //               image: cateController.categories[index].image == null
                      //                   ? FlutterLogo()
                      //                   : cateController.categories[index].image,
                      //               numOfBrands: cateController
                      //                           .categories[index].subCategories.length ==
                      //                       0
                      //                   ? 1
                      //                   : cateController
                      //                       .categories[index].subCategories.length,
                      //               press: () => Get.to(CategoriesScreen(
                      //                 categories: cateController.categories[index],
                      //               )),
                      //             );
                      //           }),
                      //           SizedBox(width: getProportionateScreenWidth(20)),
                      //         ],
                      //       );
                      //   }),
                      // ),
                    ],
                  );
        }))),
      ),
    );
  }
}
