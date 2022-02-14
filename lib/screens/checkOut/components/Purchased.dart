import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecomstore/constants.dart';
import 'package:ecomstore/screens/home/home_screen.dart';
import 'package:ecomstore/size_config.dart';

import '../../../components/default_button.dart';

class Purchased extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(title: Center(child: Text('Order Success'))),
        body: Container(
          child: Column(
            children: [
              Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      Icons.location_on,
                      size: 32,
                      color: kPrimaryColor,
                    ),
                  ),
                  Row(
                    children: List.generate(
                      3,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      EvaIcons.creditCard,
                      size: 35,
                      color: kPrimaryColor,
                    ),
                  ),
                  Row(
                    children: List.generate(
                      3,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      EvaIcons.checkmarkCircle2,
                      size: 28,
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 80,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Image.asset(
                "assets/images/success.png",
                height: SizeConfig.screenHeight * 0.25, //40%
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              Text(
                "Congrats",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(30),
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Thanks you for purchasing. Your order will be shipped in 2-5 working days',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10),
                      child: DefaultButton(
                          press: () => Get.offAll(() => HomeScreen()),
                          text: 'Continue shopping'),
                    )
                    // SizedBox(
                    //   width: SizeConfig.screenWidth * 0.6,
                    //   child: FloatingActionButton.extended(
                    //     backgroundColor: kPrimaryColor,
                    //     label: Text("Continue Shopping"),
                    //     onPressed: () {
                    //       Get.offAll(() => HomeScreen());
                    //     },
                    //   ),
                    // ),
                    // Spacer(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
