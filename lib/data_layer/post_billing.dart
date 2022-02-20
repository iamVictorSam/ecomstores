import 'dart:convert';
import 'package:ecomstore/controllers/cartController.dart';
import 'package:ecomstore/helper/baseController.dart';
import 'package:ecomstore/screens/choose_payment/choosePayment.dart';
import 'package:ecomstore/services/base_client.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final box = GetStorage();

class PostBillingController with BaseController {
  postBilling({
    required String fname,
    required String lname,
    required String company,
    required String city,
    required String state,
    required String country,
    required String address1,
    required String address2,
    required String postCode,
    required String phoneNo,
    required String fnameS,
    required String lnameS,
    required String companyS,
    required String cityS,
    required String stateS,
    required String countryS,
    required String address1S,
    required String address2S,
    required String postCodeS,
  }) async {
    final box = GetStorage();
    String id = box.read('userId').toString();
    String email = box.read('email');
    print('id $id');
    print('$email email');

    var request = {
      "first_name_billing": fname,
      "last_name_billing": lname,
      "company_billing": company,
      "address_1_billing": address1,
      "address_2_billing": address2,
      "city_billing": city,
      "state_billing": state,
      "postcode_billing": postCode,
      "country_billing": country,
      "email_billing": email,
      "phone_billing": phoneNo,
      "first_name_shipping": fnameS,
      "last_name_shipping": lnameS,
      "company_shipping": companyS,
      "address_1_shipping": address1S,
      "address_2_shipping": address2S,
      "city_shipping": cityS,
      "postcode_shipping": postCodeS,
      "country_shipping": countryS,
      "state_shipping": stateS,
    };

    showLoading('Loading');
    print(request);
    try {
      await BaseClient()
          .postSignUp('/api/v1/user/users/customer/$id', request)
          .catchError(handleError);
      Get.offAll(() => ChoosePaymentScreen());
    } catch (e) {
      print(e);
    }
    // hideLoading();
    // else{GetStorage().write('token', token);}
  }
}
