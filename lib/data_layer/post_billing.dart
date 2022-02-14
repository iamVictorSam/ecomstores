import 'dart:convert';

import 'package:ecomstore/controllers/cartController.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final box = GetStorage();

postOrder({
  String? fname,
  lname,
  city,
  state,
  country,
  address1,
  address2,
  postCode,
  phoneNo,
  fnameS,
  lnameS,
  cityS,
  stateS,
  countryS,
  address1S,
  address2S,
  postCodeS,
}) async {
  // String fname, lname, city, state, country, address1, address2, postCode, phoneNo;
  final cartController = Get.put(CartController());
  populate() {
    var checkout = [];
    for (var i = 0; i < cartController.cartCount; i++) {
      String id = cartController.cartItems[i].id.toString();
      int quantity = 1;
      dynamic details = {"product_id": id, "quantity": quantity};
      checkout.add(details);
    }
    return checkout;
  }

  String totalPrice = cartController.totalPrice.toString();

  // populate();
  /* 
  
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

  var listItem = populate();
  print('$listItem omawa');
  print("Josep[h Johnson");
  final box = GetStorage();
  String email = box.read('email');
  final uri = Uri.parse(
      'https://uandu.com.ng/endpoints/create-order.php?userEmail=$email');
  var requestBody = {
    'payment_method': 'bacs',
    'payment_method_title': 'Direct Bank Transfer',
    // 'phoneNumber': 08089633542,
    "set_paid": false,
    "billing": {
      "first_name": "$fname",
      "last_name": "$lname",
      "address_1": "$address1",
      "address_2": "$address2",
      "city": "$city",
      "state": "$state",
      "postcode": "$postCode",
      "country": "$country",
      "email": "$email",
      "phone": "$phoneNo"
    },
    "shipping": {
      "first_name": "$fnameS",
      "last_name": "$lnameS",
      "address_1": "$address1S",
      "address_2": "$address2S",
      "city": "$cityS",
      "state": "$stateS",
      "postcode": "$postCodeS",
      "country": "$countryS"
    },
    "line_items": listItem,
    "shipping_lines": [
      {
        "method_id": "flat_rate",
        "method_title": "Flat Rate",
        "total": "$totalPrice"
      }
    ]
  };

  http.Response response = await http.post(
    uri,
    body: json.encode(requestBody),
  );
  // var jsonString = response.body;

  if (response.statusCode == 200) {
    // processPayment();
  }

  var jsonString = response.body;
  // var arrayOrder = createOrderFromJson(jsonString);
  // String orderId = arrayOrder.data.orderId;

  // final box = GetStorage();
  // box.write('orderId', orderId);
  // print(box.read('orderId'));

  // CreateOrder
}
