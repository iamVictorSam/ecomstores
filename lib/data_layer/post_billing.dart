import 'dart:convert';

import 'package:ecomstore/controllers/cartController.dart';
import 'package:ecomstore/screens/choose_payment/choosePayment.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final box = GetStorage();

postOrder({
  String? fname,
  lname,
  company,
  city,
  state,
  country,
  address1,
  address2,
  postCode,
  phoneNo,
  fnameS,
  lnameS,
  companyS,
  cityS,
  stateS,
  countryS,
  address1S,
  address2S,
  postCodeS,
}) async {
/**
 * {
    "billing": {
        "first_name": "Nath",
        "last_name": "John",
        "company": "Abrack",
        "address_1": "Us",
        "address_2": "UK",
        "city": "Nevada",
        "postcode": "533112",
        "country": "USA",
        "state": "Alabama",
        "email": "deelesisuanu@gmail.com",
        "phone": "+2349031382488"
    },
    "shipping": {
        "first_name": "Nath",
        "last_name": "John",
        "company": "Abrack",
        "address_1": "Us",
        "address_2": "UK",
        "city": "Nevada",
        "postcode": "533112",
        "country": "USA",
        "state": "Alabama"
    }
}
 */

  final box = GetStorage();
  String id = box.read('userId').toString();
  String email = box.read('email');
  print('id $id');
  print('$email email');
  final uri = Uri.parse(
      'https://wp-rest-service.herokuapp.com/api/v1/user/users/customer/$id');
  var requestBody = {
    "billing": {
      "first_name": "$fname",
      "last_name": "$lname",
      "company": "$company",
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
      "company": "$companyS",
      "address_1": "$address1S",
      "address_2": "$address2S",
      "city": "$cityS",
      "state": "$stateS",
      "postcode": "$postCodeS",
      "country": "$countryS"
    },
  };
  print(requestBody);

  http.Response response = await http.put(
    uri,
    body: json.encode(requestBody),
  );
  // var jsonString = response.body;

  if (response.statusCode == 201) {
    // processPayment();
    Get.to(() => ChoosePaymentScreen());
  } else if (response.statusCode == 200) {
    // processPayment();
    Get.to(() => ChoosePaymentScreen());
  }

  var jsonString = response.body;
  print(jsonDecode(jsonString));
  // var arrayOrder = createOrderFromJson(jsonString);
  // String orderId = arrayOrder.data.orderId;

  // final box = GetStorage();
  // box.write('orderId', orderId);
  // print(box.read('orderId'));

  // CreateOrder
}
