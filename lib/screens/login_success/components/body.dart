import 'package:ecomstore/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecomstore/components/default_button.dart';
import 'package:ecomstore/screens/home/home_screen.dart';
import 'package:ecomstore/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.4, //40%
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          "Registration Success",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        // Text(
        //   "Registration Success",
        //   style: TextStyle(
        //     fontSize: getProportionateScreenWidth(30),
        //     fontWeight: FontWeight.bold,
        //     color: Colors.black,
        //   ),
        // ),
        const Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Continue to Sign in",
            press: () {
              Navigator.pushNamed(context, SignInScreen.routeName);
            },
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
