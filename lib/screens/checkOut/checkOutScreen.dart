import 'dart:async';

import 'package:ecomstore/controllers/cartController.dart';
import 'package:ecomstore/data_layer/post_billing.dart';
import 'package:ecomstore/screens/choose_payment/choosePayment.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:flutter_paystack_client/flutter_paystack_client.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:ecomstore/constants.dart';
import 'package:ecomstore/screens/checkOut/components/Purchased.dart';
import 'package:ecomstore/screens/checkOut/components/shippingScreen.dart';
import 'package:ecomstore/screens/home/home_screen.dart';
import 'package:ecomstore/size_config.dart';
import 'package:flutter/material.dart';

class LocationFormScreen extends StatefulWidget {
  @override
  _LocationFormScreenState createState() => _LocationFormScreenState();
}

class _LocationFormScreenState extends State<LocationFormScreen> {
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController company = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController postCode = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address1 = TextEditingController();
  TextEditingController address2 = TextEditingController();
  TextEditingController country = TextEditingController();

  final cartController = Get.put(CartController());
  late Timer _timer;
  bool isloading = false;

  String _email = '';
  int _amount = 0;
  String _message = '';

  var publicKey = 'pk_test_4f1cebce3dba743b1414645a1f5ade8528d74138';
  final plugin = PaystackPlugin();

  @override
  void initState() {
    plugin.initialize(publicKey: publicKey);
  }

  final posting = PostBillingController();

  final box = GetStorage();

  // final billingController = BillingController.to;
  // final billingController = Get.put(BillingController());

  Dialog successDialog(context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0)), //this right here
      child: Container(
        height: 350.0,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.check_box,
                color: HexColor("#41aa5e"),
                size: 90,
              ),
              SizedBox(height: 15),
              Text(
                'Payment has successfully',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'been made',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Text(
                "Your payment has been successfully",
                style: TextStyle(fontSize: 13),
              ),
              Text("processed.", style: TextStyle(fontSize: 13)),
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog() {
    // flutter defined function
    // setState(() {
    //   isPaid = !isPaid;
    // });

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        _timer = Timer(Duration(seconds: 3), () {
          Navigator.pop(context);
        });

        return successDialog(context);
      },
    ).then((value) {
      if (_timer.isActive) {
        _timer.cancel();
      }
    });
  }

  Dialog errorDialog(context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0)), //this right here
      child: Container(
        height: 350.0,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.cancel,
                color: Colors.red,
                size: 90,
              ),
              SizedBox(height: 15),
              Text(
                'Failed to process payment',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Text(
                "Error in processing payment, please try again",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showErrorDialog() {
    // flutter defined function
    // setState(() {
    //   isPaid = true;
    // });

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        _timer = Timer(Duration(seconds: 3), () {
          Navigator.pop(context);
        });

        return errorDialog(context);
      },
    ).then((value) {
      if (_timer.isActive) {
        _timer.cancel();
      }
    });
  }

  showError(String message) {
    Alert(
      context: context,
      // closeFunction: () => ,
      type: AlertType.info,
      title: 'Info',
      // onWillPopActive: ture,
      desc: message,
      closeFunction: () {
        Navigator.pop(context);
      },
      buttons: [
        DialogButton(
          child: Text(
            'Yes',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
          onPressed: () {
            try {
              Navigator.pop(context);
              posting.postBilling(
                fname: fname.text,
                lname: lname.text,
                company: company.text,
                city: city.text,
                country: country.text,
                state: state.text,
                phoneNo: phone.text,
                postCode: postCode.text,
                address1: address1.text,
                address2: address2.text,
                fnameS: fname.text,
                lnameS: lname.text,
                companyS: company.text,
                cityS: city.text,
                countryS: country.text,
                stateS: state.text,
                address1S: address1.text,
                address2S: address2.text,
                postCodeS: postCode.text,
              );

              // Navigator.pop(context);
            } catch (e) {
              // showError(e.toString());
            }
          },
        ),
        DialogButton(
          child: Text(
            'No',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
            Get.to(() => ShippingScreen(
                  bAddress1: address1.text,
                  bAddress2: address2.text,
                  bCompany: company.text,
                  bCity: city.text,
                  bCountry: country.text,
                  bEmail: email.text,
                  bFname: fname.text,
                  bLname: lname.text,
                  bPhoneNo: phone.text,
                  bPostCode: postCode.text,
                  bState: state.text,
                ));
          },
        )
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Checkout')),
      body: isloading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(height: 30),

                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Icon(
                              Icons.location_on,
                              size: 32,
                              color: kPrimaryColor,
                            ),
                          ),
                          Row(
                            children: List.generate(
                              3,
                              (index) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Container(
                                  height: 5,
                                  width: 5,
                                  decoration: BoxDecoration(
                                    color: Colors.blueGrey,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Icon(
                              EvaIcons.creditCard,
                              size: 35,
                              color: Colors.blueGrey,
                            ),
                          ),
                          Row(
                            children: List.generate(
                              3,
                              (index) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Container(
                                  height: 5,
                                  width: 5,
                                  decoration: BoxDecoration(
                                    color: Colors.blueGrey,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Icon(
                              EvaIcons.checkmarkCircle2,
                              size: 28,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Text(
                          'Step 1',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Text(
                          'Billing',
                          style: TextStyle(
                              fontSize: 22,
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Form(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: fname,
                                decoration: InputDecoration(
                                  labelText: "First Name",
                                  // hintText: "Re-enter your password",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 8),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: lname,
                                decoration: InputDecoration(
                                  labelText: "Last Name",
                                  // hintText: "Re-enter your password",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 8),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: company,
                                decoration: InputDecoration(
                                  labelText: "Company",
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 8),
                                  // hintText: "Re-enter your password",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                  // disabledBorder: UnderlineInputBorder(),

                                  // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: address1,
                                decoration: InputDecoration(
                                  labelText: "Address 1",
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 8),
                                  // hintText: "Re-enter your password",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                  // disabledBorder: UnderlineInputBorder(),

                                  // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: address2,
                                decoration: InputDecoration(
                                  labelText: "Address 2",
                                  // hintText: "Re-enter your password",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 8),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: city,
                                      decoration: InputDecoration(
                                        labelText: "City",
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 8),
                                        // hintText: "Re-enter your password",
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.auto,
                                        // disabledBorder: UnderlineInputBorder(),

                                        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 18,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller: postCode,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        labelText: "Postal or Zip Code",
                                        // hintText: "Re-enter your password",
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.auto,
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 8),
                                        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: state,
                                decoration: InputDecoration(
                                  labelText: "State",
                                  // hintText: "Re-enter your password",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 8),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: country,
                                decoration: InputDecoration(
                                  labelText: "Country",
                                  // hintText: "Re-enter your password",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 8),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.phone,
                                controller: phone,
                                decoration: InputDecoration(
                                  labelText: "Phone NO",
                                  // hintText: "Re-enter your password",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 8),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: FloatingActionButton.extended(
                          onPressed: () {
                            showError(
                                'Do You want to use Your Billing Address as shipping Address?');
                          },
                          label: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 40.0),
                            child: Text(
                              'Continue To Payment',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          backgroundColor: kPrimaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
