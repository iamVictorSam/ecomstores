import 'package:ecomstore/controllers/cartController.dart';
import 'package:ecomstore/controllers/orderDetailsController.dart';
import 'package:ecomstore/data_layer/userInfo.dart';
import 'package:ecomstore/screens/orders/orders.dart';
import 'package:ecomstore/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  final cartController = Get.put(CartController());
  final userController = Get.put(UserController());
  final orders = Get.put(GetOrderDetailsController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "Orders",
            icon: "assets/icons/User Icon.svg",
            press: () => Get.to(() => Orders()),
          ),
          ProfileMenu(
            text: "Notifications",
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {
              GetStorage()
                  .remove('username')
                  .whenComplete(() => Get.offAll(SignInScreen()));
            },
          ),
        ],
      ),
    );
  }
}
