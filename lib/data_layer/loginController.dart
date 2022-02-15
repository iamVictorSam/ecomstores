import 'dart:convert';

import 'package:ecomstore/helper/baseController.dart';
import 'package:ecomstore/screens/home/home_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ecomstore/services/base_client.dart';

class LoginController with BaseController {
  void login(String username, String password) async {
    var request = {
      "username": username,
      "password": password,
    };
    showLoading('Posting data...');
    var response = await BaseClient()
        .postSignUp('/api/v1/auth/users/login', request)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    var result = jsonDecode(response);
    var token = result['data']['jwt'];
    GetStorage().write('username', username);
    GetStorage()
        .write('token', token)
        .whenComplete(() => Get.offAll(() => HomeScreen()));
  }
}
