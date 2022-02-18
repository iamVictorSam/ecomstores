import 'dart:convert';
import 'package:ecomstore/data_layer/models/all_products.dart';
import 'package:ecomstore/data_layer/models/user_info.dart';
import 'package:ecomstore/helper/baseController.dart';
import 'package:ecomstore/services/base_client.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// import 'package:get_storage/get_storage.dart';

class UserController with BaseController {
// Get
  // Future getUserInfo() async {
  //   var userName = GetStorage().read('username');
  //   print(userName);
  //   // showLoading('Fetching data...');

  //   var response = await BaseClient()
  //       .get(
  //         '/api/v1/user/users/search/username/$userName',
  //       )
  //       .catchError(handleError);
  //   if (response == null) return;
  //   // hideLoading();

  //   var resolve = jsonDecode(response);
  //   var userId = resolve['data']['id'];
  //   GetStorage().write('userId', userId);
  //   final result = jsonDecode(response) as Map;

  //   final data = result['data'] as Map;
  //   print(data);
  //   final datu = jsonEncode(data);
  //   return userInfoFromJson(datu);
  // }

  Future getUserInfo() async {
    var userList = [];
    var userName = GetStorage().read('username');
    print(userName);
    // showLoading('Fetching data...');
    var id = GetStorage().read('userId');

    var response = await BaseClient()
        .get(
          '/api/v1/user/users/customer/$id',
        )
        .catchError(handleError);
    if (response == null) return;
    // hideLoading();

    print(jsonDecode(response));

    return userInfoFromJson(response);
  }

  // api/v1/user/users/customer/shipping/330

}
