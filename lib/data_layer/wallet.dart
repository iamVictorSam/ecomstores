import 'dart:convert';

import 'package:ecomstore/data_layer/models/balance.dart';
import 'package:ecomstore/data_layer/orders.dart';
import 'package:ecomstore/helper/baseController.dart';
import 'package:ecomstore/screens/profile/profile_screen.dart';
import 'package:ecomstore/screens/settings/settings.dart';
import 'package:ecomstore/services/base_client.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class Wallet with BaseController {
  Future creditWallet(int amt) async {
    var request = {"amount": amt, "wallet_trans": "credit"};
    showLoading('Fetching data...');
    var id = GetStorage().read('userId');
    print(id);
    var response = await BaseClient()
        .post('/api/v1/user/users/wallet/$id', request)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    Get.offAll(() => ProfileScreen());

    // final result = jsonDecode(response) as Map;
  }

  final controller = OrdersControlller();

  Future debitWallet(int amt, BuildContext context) async {
    var request = {"amount": amt, "wallet_trans": "debit"};
    showLoading('Fetching data...');
    var id = GetStorage().read('userId');
    print(id);
    var response = await BaseClient()
        .post('/api/v1/user/users/wallet/$id', request)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    controller.createOrderCod(context);
    // final result = jsonDecode(response) as Map;
  }

  // Future checkBallance() async {
  //   // showLoading('Fetching data...');
  //   var id = GetStorage().read('userId');
  //   print(id);
  //   var response = await BaseClient()
  //       .getWithBearer('api/v1/user/users/get/user/balance/368')
  //       .catchError(handleError);
  //   if (response == null) return;
  //   // hideLoading();
  //   print(response);

  //   return Balance.fromJson(response);

  //   // final result = jsonDecode(response) as Map;
  // }

  Future checkBallance() async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://wp-rest-service.herokuapp.com/api/v1/user/users/get/user/balance/369'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var result = jsonDecode(await response.stream.bytesToString());
      return (result['balance']);
      // return balanceFromJson(await response.stream.bytesToString());

      // var result2 = jsonEncode(result);

      //  Balance.fromJson(result2);
      //  return jsonDecode(response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
