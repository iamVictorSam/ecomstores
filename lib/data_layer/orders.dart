import 'dart:convert';

import 'package:ecomstore/controllers/cartController.dart';
import 'package:ecomstore/data_layer/models/order_details.dart';
import 'package:ecomstore/helper/baseController.dart';
import 'package:ecomstore/screens/checkOut/components/Purchased.dart';
import 'package:ecomstore/screens/home/home_screen.dart';
import 'package:ecomstore/services/base_client.dart';
import 'package:flutter_paystack_client/flutter_paystack_client.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

/**
 * {
    "payment_method_id": "cod",
    "payment_method": "Cash on delivery",
    "items": [
        { "product_id": 12030, "quantity": 2 },
        { "product_id": 12028, "quantity": 2 }
    ],
    "shipping_methods": [
        { "method_id": "flat_rate", "method_title": "Flat Rate", "total": "10.00" }
    ],
    "hasPaid": false
}
 */

class OrdersControlller with BaseController {
  final cartController = Get.put(CartController());
  var id = GetStorage().read('userId');
  String _email = 'iamvictorsam@gmail.com';
  String _message = ' Purchase payment from email';

  // var publicKey = 'pk_test_4f1cebce3dba743b1414645a1f5ade8528d74138';

  void createOrderPayStack(context) async {
    populate() {
      var checkout = [];
      for (var i = 0; i < cartController.cartCount; i++) {
        String id = cartController.cartItems[i].productId.toString();
        int quantity = 1;
        dynamic details = {"product_id": id, "quantity": quantity};
        // checkout.add(details);
        checkout.add(details);
      }
      return checkout;
    }

//
    var items = populate();
    // var item = ...items;
    print(items);
    var request = {
      "payment_method_id": 'paystack',
      "payment_method": "Pay With Debit/Credit Cards",
      "items": items,
      "shipping_methods": [
        {
          "method_id": "flat_rate",
          "method_title": "Flat Rate",
          "total": cartController.totalPrice.toString()
        }
      ],
      "hasPaid": false
    };
    showLoading('Posting data...');
    var response = await BaseClient()
        .post('/api/v1/order/users/orders/$id', request)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    cartController.cartItems.clear();

    Get.offAll(Purchased());

    var result = jsonDecode(response);
    if (result['status'] == 'success') {}
    print(result);
    // GetStorage()
    //     .write('token', token)
    //     .whenComplete(() => Get.offAll(() => HomeScreen()));
  }

  void createOrderCod(context) async {
    int _amount = cartController.totalPrice.toInt();
    populate() {
      var checkout = [];
      for (var i = 0; i < cartController.cartCount; i++) {
        String id = cartController.cartItems[i].productId.toString();
        int quantity = 1;
        dynamic details = {"product_id": id, "quantity": quantity};
        // checkout.add(details);
        checkout.add(details);
      }
      return checkout;
    }

//
    var items = populate();
    // var item = ...items;
    print(items);
    var request = {
      "payment_method_id": 'cod',
      "payment_method": "Cash on delivery",
      "items": items,
      "shipping_methods": [
        {
          "method_id": "flat_rate",
          "method_title": "Flat Rate",
          "total": cartController.totalPrice.toString()
        }
      ],
      "hasPaid": false
    };
    showLoading('Posting data...');
    var response = await BaseClient()
        .post('/api/v1/order/users/orders/347', request)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();

    cartController.cartItems.clear();
    Get.offAll(Purchased());
    var result = jsonDecode(response);
    if (result['status'] == 'success') {}
    print(result);
    // GetStorage()
    //     .write('token', token)
    //     .whenComplete(() => Get.offAll(() => HomeScreen()));
  }

  Future getOrderDetails() async {
    // showLoading('Fetching data...');
    var id = GetStorage().read('userId');
    print(id);
    var response = await BaseClient()
        .get(
          '/api/v1/order/users/orders/347',
        )
        .catchError(handleError);
    if (response == null) return;
    // hideLoading();

    final result = jsonDecode(response) as Map;

    final data = result['data'] as List;
    final datu = jsonEncode(data);
    return retrieveOrdersFromJson(datu);
  }
}
