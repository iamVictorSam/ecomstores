import 'dart:convert';

import 'package:ecomstore/helper/baseController.dart';
import 'package:ecomstore/screens/home/home_screen.dart';
import 'package:ecomstore/screens/sign_in/sign_in_screen.dart';
import 'package:get/get.dart';
import 'package:ecomstore/services/base_client.dart';
import 'package:get_storage/get_storage.dart';

class SignUpController with BaseController {
  void signup(String fname, String lname, String email, String password,
      String username) async {
    var request = {
      "first_name": fname,
      "last_name": lname,
      "email": email,
      "password": password,
      "username": username,
    };
    // showLoading('Loading');
    print(request);
    try {
      await BaseClient().postSignUp('/api/v1/auth/users', request);
      // .catchError(handleError);
      Get.offAll(() => SignInScreen());
    } catch (e) {
      print(e);
    }
    // hideLoading();
    // else{GetStorage().write('token', token);}
  }
}
