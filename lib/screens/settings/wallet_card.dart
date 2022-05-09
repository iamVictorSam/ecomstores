// ignore_for_file: prefer_const_constructors

import 'package:ecomstore/components/default_button.dart';
import 'package:ecomstore/controllers/balanceController.dart';
import 'package:ecomstore/data_layer/models/balance.dart';
import 'package:ecomstore/data_layer/wallet.dart';
import 'package:ecomstore/screens/settings/fund_wallet.dart';
import 'package:ecomstore/screens/settings/settings.dart';
import 'package:ecomstore/services/base_client.dart';
import 'package:ecomstore/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:flutter_paystack_client/flutter_paystack_client.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:ecomstore/services/app_exceptions.dart';
import '../../constants.dart';
import '../../sizeConfig2.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

class WalletCard extends StatefulWidget {
  final String? amount;

  const WalletCard(
    this.amount,
  );

  @override
  State<WalletCard> createState() => _WalletCardState();
}

class _WalletCardState extends State<WalletCard> {
  // final controller = Wallet().checkBallance2();

  bool isBool = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.topLeft,
      // height: 240,
      // width: getScreenWidth(12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(10), // boxShadow: [
        boxShadow: [
          BoxShadow(
            color: Color(0xFFA4A4A8),
            offset: Offset(1.0, 5.0),
            blurRadius: 7,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Wallet Balance',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  isBool
                      ? '₦ ${widget.amount!.replaceAll("\"", " ")}'
                      : '₦ * * * * * * * ',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  icon: Icon(
                      isBool
                          ? Icons.remove_red_eye
                          : Icons.visibility_off_rounded,
                      color: Colors.white,
                      size: 25),
                  onPressed: () {
                    setState(() {
                      isBool = !isBool;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 1,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 40,
              ),
              child: FundWalletBtn(
                text: 'Fund wallet',
                press: () async {
                  Get.to(AddAmountScreen());
                },
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}

class AddAmountScreen extends StatefulWidget {
  const AddAmountScreen({Key? key}) : super(key: key);

  @override
  State<AddAmountScreen> createState() => _AddAmountScreenState();
}

class _AddAmountScreenState extends State<AddAmountScreen> {
  final String _email = GetStorage().read('email');
  String _message = ' Purchase payment from email';

  var publicKey = '[YOUR_PAYSTACK_PUBLIC_KEY]';
  final plugin = PaystackPlugin();

  @override
  void initState() {
    plugin.initialize(publicKey: publicKey);
  }

  final textController = TextEditingController();
  final controller = Wallet();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Fund Wallet',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  // Text(''),
                  SizedBox(
                    height: 60,
                  ),

                  TextFormField(
                    controller: textController,

                    //7510139484
                    onFieldSubmitted: (String value) {},
                    validator: (String? value) {
                      if (value == '0' && value!.isEmpty) {
                        return 'Please enter a valid amount';
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        hintText: 'Enter Amount',
                        label: Text('Enter Amount'),
                        prefix: Text('₦')),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  DefaultButton(
                    text: 'Fund Account',
                    press: () async {
                      final isFormValid = formKey.currentState!.validate();

                      if (isFormValid) {
                        int _amount = int.parse(textController.text) * 100;

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
                        final res = await PaystackClient.checkout(context,
                            charge: charge);

                        if (res.status) {
                          print(res.status);
                          _message =
                              'Charge was successful. Ref: ${res.reference}';
                          controller
                              .creditWallet(int.parse(textController.text));
                        } else {
                          _message = 'Failed: ${res.message}';
                        }
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
