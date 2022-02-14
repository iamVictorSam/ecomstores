import 'package:ecomstore/controllers/cartController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class CheckoutCard extends StatelessWidget {
  final cartController = Get.put(CartController());
  CheckoutCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: getProportionateScreenWidth(40),
                  width: getProportionateScreenWidth(40),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset("assets/icons/receipt.svg"),
                ),
                Spacer(),
                Text("Add voucher code"),
                const SizedBox(width: 10),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kTextColor,
                )
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => Text.rich(
                      TextSpan(
                        text: "Total:\n",
                        children: [
                          TextSpan(
                            text:
                                "N${cartController.totalPrice.toStringAsFixed(2)}",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),
                    )),
                Obx(() {
                  return SizedBox(
                      width: getProportionateScreenWidth(190),
                      child: cartController.cartItems.length == 0
                          ? Container(
                              child: SizedBox(
                              width: double.infinity,
                              height: getProportionateScreenHeight(56),
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                color: kTextColor,
                                onPressed: () {},
                                child: Text(
                                  'Check Out',
                                  style: TextStyle(
                                    fontSize: getProportionateScreenWidth(18),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ))
                          : DefaultButton(text: "Check Out", press: () {})
                      // : DefaultButton(
                      //     text: "Check Out",
                      //     press: () {
                      //       final box = GetStorage();
                      //       if(box.read('email') == null || isBlank){
                      //         Get.to(() => SignUpScreen());
                      //       }else{
                      //          Get.to(() => LocationFormScreen());
                      //       }

                      //     },
                      //   ),
                      );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
