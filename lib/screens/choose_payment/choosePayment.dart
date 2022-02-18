import 'package:ecomstore/components/default_button.dart';
import 'package:ecomstore/constants.dart';
import 'package:ecomstore/controllers/cartController.dart';
import 'package:ecomstore/data_layer/orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack_client/flutter_paystack_client.dart';
import 'package:get/get.dart';

class ChoosePaymentScreen extends StatelessWidget {
  ChoosePaymentScreen({Key? key}) : super(key: key);
  final createOrder = OrdersControlller();
  final cartController = Get.put(CartController());

  String _email = 'iamvictorsam@gmail.com';
  String _message = ' Purchase payment from email';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Choose Payment method',
        style: TextStyle(color: Colors.black),
      )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  createOrder.createOrderCod(context);
                  //                         .createOrder(context);
                },
                child: Text(
                  'Pay with on Delivery',
                  style: TextStyle(color: kPrimaryColor, fontSize: 20),
                )),
            SizedBox(height: 25),
            DefaultButton(
              text: 'Pay with PayStack',
              press: () async {
                int _amount = 1000 * cartController.totalPrice.toInt();

                final charge = Charge()
                  ..email = _email
                  ..amount = _amount * 100
                  ..reference = 'ref_${DateTime.now().millisecondsSinceEpoch}';
                final res =
                    await PaystackClient.checkout(context, charge: charge);

                if (res.status) {
                  print(res.status);
                  createOrder.createOrderPayStack(context);
                  _message = 'Charge was successful. Ref: ${res.reference}';
                } else {
                  _message = 'Failed: ${res.message}';
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
