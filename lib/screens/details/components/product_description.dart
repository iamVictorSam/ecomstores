import 'package:ecomstore/data_layer/models/all_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ecomstore/models/Product.dart';
import 'package:get/state_manager.dart';
// import 'package:flutter_html.dart'

import '../../../constants.dart';
import '../../../size_config.dart';

class ProductDescription extends StatelessWidget {
  ProductDescription({
    Key? key,
    required this.product,
    this.pressOnSeeMore,
  }) : super(key: key);

  final product;
  final GestureTapCallback? pressOnSeeMore;
  static RxBool isOpen = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: Text(
                product.productName,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    '₦${product.price}',
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Category:',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                  ],
                ),
              ),
            ),
            Wrap(
              children: [
                ...List.generate(
                    product.categories.length,
                    (index) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5.0,
                          ),
                          decoration: BoxDecoration(
                              color: kSecondaryColor.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(7)),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 10),
                          child: Text(product.categories[index].name),
                        )),
              ],
            ),
            // Align(
            //   alignment: Alignment.centerRight,
            //   child: Container(
            //     padding: EdgeInsets.all(getProportionateScreenWidth(15)),
            //     width: getProportionateScreenWidth(64),
            //     decoration: BoxDecoration(
            //       color:
            //           product.isFavourite ? Color(0xFFFFE6E6) : Color(0xFFF5F6F9),
            //       borderRadius: Border)Radius.only(
            //         topLeft: Radius.circular(20),
            //         bottomLeft: Radius.circular(20),
            //       ),
            //     ),
            //     child: SvgPicture.asset(
            //       "assets/icons/Heart Icon_2.svg",
            //       color:
            //           product.isFavourite ? Color(0xFFFF4848) : Color(0xFFDBDEE4),
            //       height: getProportionateScreenWidth(16),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: EdgeInsets.only(
            //     left: getProportionateScreenWidth(20),
            //     right: getProportionateScreenWidth(64),
            //   ),
            //   child: Text(
            //     product.description,
            //     maxLines: 3,
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.only(
                left: getProportionateScreenWidth(20),
                right: getProportionateScreenWidth(64),
              ),
              child: Html(data: """${product.shortDescription}"""),
              // maxLines: 3,
            ),
            isOpen.value == true
                ? Padding(
                    padding: EdgeInsets.only(
                      left: getProportionateScreenWidth(20),
                      right: getProportionateScreenWidth(64),
                    ),
                    child: Html(data: """${product.description}"""),
                    // maxLines: 3,
                  )
                : Container(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: 10,
              ),
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => {
                        if (isOpen.isFalse)
                          {isOpen(true)}
                        else if (isOpen.isTrue)
                          {isOpen(false)}
                      },
                      child: Obx(() => isOpen.value
                          ? Text(
                              "See less Details",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: kPrimaryColor),
                            )
                          : Text(
                              "See more Details",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: kPrimaryColor),
                            )),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: kPrimaryColor,
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

// teach coding to Nonso(
//   send animes to chichi 
//   mtn and airtel data  
// ),

