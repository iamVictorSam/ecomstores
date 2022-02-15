import 'package:ecomstore/controllers/userInforController.dart';
import 'package:flutter/material.dart';
import 'package:ecomstore/components/coustom_bottom_nav_bar.dart';
import 'package:ecomstore/enums.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    // var userId = userInfo.getUserInfo[0].id;
    // GetStorage().write('id', userId);
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
