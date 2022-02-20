import 'package:ecomstore/components/default_button.dart';
import 'package:ecomstore/data_layer/models/all_products.dart';
import 'package:ecomstore/data_layer/models/cate_products.dart';
import 'package:ecomstore/screens/cateScreen/components/view_cate_prodcard.dart';
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

  final GetAllCatProductsController cateController =
      Get.put(GetAllCatProductsController());

  final cateProductController = Get.put(GetAllCatProductsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              cateProductController.getAllProducts.length == 0
                  ? Column(children: [
                      Text(
                        'No items Available',
                        style: TextStyle(fontSize: 30, color: kPrimaryColor),
                      ),
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
                            press: () => Get.to(() => SeeAllPopular()),
                            text: 'Browse Products Here'),
                      )
                    ])
                  : Container(
                      height: getProportionateScreenHeight(250),
                      width: double.infinity,
                      child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              cateProductController.getAllProducts.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 0.4),
                          itemBuilder: (BuildContext context, int index) {
                            // print(index);

                            // return GestureDetector(
                            //   onTap: () => Navigator.pushNamed(
                            //     context,
                            //     DetailsByOrderScreen.routeName,
                            //     arguments: ProductDetailsArguments1(
                            //         i: index,
                            //         product: widget.retrieveOrder,
                            //         status: widget.retrieveOrder.status),
                            //   ),
                            return Container(
                              // decoration: BoxDecoration(
                              //     border:
                              //         Border.all(color: Colors.black)),
                              child:
                                  cateProductController.getAllProducts.length ==
                                          0
                                      ? Container()
                                      : Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: LineItemes(
                                            image: cateProductController
                                                .getAllProducts[index]
                                                .productImages[0]
                                                .src,
                                            itemName: cateProductController
                                                .getAllProducts[index]
                                                .productName,
                                            price: cateProductController
                                                .getAllProducts[index].price
                                                .toString(),
                                          ),
                                        ),
                              // ),
                            );
                          }),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
