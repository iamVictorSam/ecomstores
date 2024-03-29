import 'package:ecomstore/components/default_button.dart';
import 'package:ecomstore/constants.dart';
import 'package:ecomstore/controllers/cartController.dart';
import 'package:ecomstore/data_layer/orders.dart';
import 'package:ecomstore/data_layer/wallet.dart';
import 'package:ecomstore/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:flutter_paystack_client/flutter_paystack_client.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// ignore: must_be_immutable
class ChoosePaymentScreen extends StatelessWidget {
  ChoosePaymentScreen({Key? key}) : super(key: key);
  final createOrder = OrdersControlller();
  final cartController = Get.put(CartController());

  final String _email = GetStorage().read('email');
  String _message = ' Purchase payment from email';

  var publicKey = '[YOUR_PAYSTACK_PUBLIC_KEY]';
  final plugin = PaystackPlugin();

  @override
  void initState() {
    plugin.initialize(publicKey: publicKey);
  }

  final controller = Wallet();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Do something here
        Get.off(HomeScreen());
        print("After clicking the Android Back Button");
        return false;
      },
      child: Scaffold(
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
                  int _amount = 100 * cartController.totalPrice.toInt();

                  //              Charge charge = Charge()
                  //    ..amount = 10000
                  //    ..reference = 'ref_${DateTime.now().millisecondsSinceEpoch}'
                  //     // or ..accessCode = _getAccessCodeFrmInitialization()
                  //    ..email = 'iamvictorsam@email.com';
                  //  CheckoutResponse response = await plugin.checkout(
                  //    context context,
                  //    method: CheckoutMethod.card, // Defaults to CheckoutMethod.selectable
                  //    charge: charge,
                  //  );

                  final charge = Charge()
                    ..email = _email
                    ..amount = _amount
                    ..reference =
                        'ref_${DateTime.now().millisecondsSinceEpoch}';
                  final res =
                      await PaystackClient.checkout(context, charge: charge);

                  if (res.status) {
                    print(res.status);
                    createOrder.createOrderPayStack(context);
                    _message = 'Charge was successful. Ref: ${res.reference}';
                  } else {
                    _message = 'Failed: ${res.message}';
                  }
                  print(_message);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              DefaultButton(
                text: 'Pay from Wallet',
                bgColor: Colors.teal,
                press: () {
                  controller.debitWallet(
                      cartController.totalPrice.toInt(), context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
