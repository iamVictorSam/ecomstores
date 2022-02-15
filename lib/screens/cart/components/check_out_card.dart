import 'package:ecomstore/controllers/cartController.dart';
import 'package:ecomstore/data_layer/orders.dart';
import 'package:ecomstore/screens/checkOut/checkOutScreen.dart';
import 'package:ecomstore/screens/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack_client/flutter_paystack_client.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class CheckoutCard extends StatelessWidget {
  final cartController = Get.put(CartController());
  final createOrder = OrdersControlller();
  String _email = 'iamvictorsam@gmail.com';
  int _amount = 0;
  String _message = '';

  var publicKey = 'pk_live_3c7b2be1f48b19309aac1e7791e036f7511d139a';

  @override
  void initState() {
    PaystackClient.initialize(publicKey);
  }

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
                        // : DefaultButton(text: "Check Out", press: () {})
                        : DefaultButton(
                            text: "Check Out",
                            press: () {
                              Get.dialog(Dialog(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Choose payment method',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 50,
                                      ),
                                      Row(
                                        children: [
                                          // DefaultButton(
                                          //   press: () {},
                                          //   text: 'Pay on Delivery',
                                          // ),
                                          Expanded(
                                            child: TextButton(
                                                onPressed: () {
                                                  createOrder
                                                      .createOrder(context);
                                                },
                                                child: Text('Pay on Delivery')),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 20.0),
                                              child: ElevatedButton(
                                                  onPressed: () async {
                                                    createOrder
                                                        .createOrder(context);

                                                    // final charge = Charge()
                                                    //   ..email = _email
                                                    //   ..amount = _amount
                                                    //   ..reference =
                                                    //       'ref_${DateTime.now().millisecondsSinceEpoch}';
                                                    // final res =
                                                    //     await PaystackClient
                                                    //         .checkout(context,
                                                    //             charge: charge);

                                                    // if (res.status) {
                                                    //   _message =
                                                    //       'Charge was successful. Ref: ${res.reference}';
                                                    // } else {
                                                    //   _message =
                                                    //       'Failed: ${res.message}';
                                                    // }
                                                  },
                                                  child: Text('Pay with Card')),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ));
                              // final box = GetStorage();
                              // if (box.read('username').isBlank) {
                              //   Get.to(() => SignUpScreen());
                              // } else {
                              //   Get.to(() => LocationFormScreen());
                              // }
                            },
                          ),
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
