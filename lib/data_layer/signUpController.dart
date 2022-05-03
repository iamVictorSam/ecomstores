import 'dart:convert';

import 'package:ecomstore/helper/baseController.dart';
import 'package:ecomstore/screens/home/home_screen.dart';
import 'package:ecomstore/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
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
    showLoading('Loading');
    print(request);
    try {
      var response = await BaseClient()
          .postSignUp('/api/v1/auth/users', request)
          .catchError(handleError);
      hideLoading();
      if (response == null) return;
      const GetSnackBar(
        title: 'Account Created',
        message: 'Please Sign in',
        backgroundColor: Colors.green,
      );
      Future.delayed(3000.milliseconds, () {
        GetStorage()
            .write('email', email)
            .whenComplete(() => Get.offAll(() => SignInScreen()));
      });
    } catch (e) {
      print(e);
    }
    // else{GetStorage().write('token', token);}
  }
}
