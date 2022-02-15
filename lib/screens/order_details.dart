// ignore: must_be_immutable
import 'dart:async';

import 'package:ecomstore/components/default_button.dart';
import 'package:ecomstore/constants.dart';
import 'package:ecomstore/data_layer/models/order_details.dart';
import 'package:ecomstore/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// import 'package:shop_app/models/retrieveOrderModel.dart' as retrieveOrders;

// import 'package:shop_app/models/retrieveOrderModel.dart' ;

class OrderDetails extends StatefulWidget {
  OrderDetails({
    Key? key,
    required this.retrieveOrder,
  }) : super(key: key);

  final RetrieveOrders retrieveOrder;

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  // final cartController = Get.put(CartController());

  final box = GetStorage();
  Timer? _timer;
  bool isloading = false;

  showError(String message) {
    Alert(
      context: context,
      // closeFunction: () => ,
      type: AlertType.error,
      title: 'Error',
      // onWillPopActive: ture,
      desc: message,
      closeFunction: () {
        Navigator.pop(context);
      },
    ).show();
  }

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
                color: Color(0xff41aa5e),
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
      if (_timer!.isActive) {
        _timer!.cancel();
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
      if (_timer!.isActive) {
        _timer!.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: isloading
          ? Center(child: CircularProgressIndicator())
          : Container(
              child: SingleChildScrollView(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Order code:'),
                            Text(
                              widget.retrieveOrder.orderKey,
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            'Products puchased',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        Container(
                          height: getProportionateScreenHeight(250),
                          width: double.infinity,
                          child: GridView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: widget.retrieveOrder.lineItems.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2, childAspectRatio: 0.4),
                              itemBuilder: (BuildContext context, int index) {
                                print(index);

                                return GestureDetector(
                                  // onTap: () => Navigator.pushNamed(
                                  //   context,
                                  //   DetailsByOrderScreen.routeName,
                                  //   arguments: ProductDetailsArguments1(
                                  //       i: index,
                                  //       product: widget.retrieveOrder,
                                  //       status: widget.retrieveOrder.status),
                                  // ),
                                  onTap: () {},
                                  child: Container(
                                    // decoration: BoxDecoration(
                                    //     border:
                                    //         Border.all(color: Colors.black)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: LineItemes(
                                        // image: widget.retrieveOrder
                                        //     .lineItems[index].thumbnail,
                                        image: '',
                                        itemName: widget.retrieveOrder
                                            .lineItems[index].name,
                                        price: widget.retrieveOrder
                                            .lineItems[index].price
                                            .toString(),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            'Payment details',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        Card(
                          child: Container(
                            // decoration: BoxDecoration(
                            //   border: Border.all(color: Colors.black),
                            //   borderRadius: BorderRadius.all(
                            //     Radius.circular(10),
                            //   ),
                            // ),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Text('Status:'),
                                  trailing: Text(widget.retrieveOrder.status),
                                ),
                                ListTile(
                                  leading: Text('No of products:'),
                                  trailing: Text(widget
                                      .retrieveOrder.lineItems.length
                                      .toString()),
                                ),
                                ListTile(
                                  leading: Text('Date Created:'),
                                  trailing: Text(widget
                                      .retrieveOrder.dateCreated
                                      .toString()),
                                ),
                                ListTile(
                                  leading: Text('Date Modified:'),
                                  trailing: Text(widget
                                      .retrieveOrder.dateModified
                                      .toString()),
                                ),
                                ListTile(
                                  leading: Text('Total Amount:'),
                                  trailing: Text(widget.retrieveOrder.total),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            'Shipping details',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        Card(
                          child: Container(
                            // decoration: BoxDecoration(
                            //   border: Border.all(color: Colors.black),
                            //   borderRadius: BorderRadius.all(
                            //     Radius.circular(10),
                            //   ),
                            // ),
                            child: Column(children: [
                              ListTile(
                                leading: Text('First Name:'),
                                trailing: Text(
                                    widget.retrieveOrder.shipping.firstName),
                              ),
                              ListTile(
                                leading: Text('Last Name:'),
                                trailing: Text(
                                    widget.retrieveOrder.shipping.lastName),
                              ),
                              ListTile(
                                leading: Text('Address 1:'),
                                trailing: Text(
                                    widget.retrieveOrder.shipping.address1),
                              ),
                              ListTile(
                                leading: Text('Address 2:'),
                                trailing: Text(
                                    widget.retrieveOrder.shipping.address2),
                              ),
                              ListTile(
                                leading: Text('City:'),
                                trailing:
                                    Text(widget.retrieveOrder.shipping.city),
                              ),
                              ListTile(
                                leading: Text('State:'),
                                trailing:
                                    Text(widget.retrieveOrder.shipping.state),
                              ),
                              ListTile(
                                leading: Text('Postal Code:'),
                                trailing: Text(
                                    widget.retrieveOrder.shipping.postcode),
                              ),
                              ListTile(
                                leading: Text('Country:'),
                                trailing:
                                    Text(widget.retrieveOrder.shipping.country),
                              ),
                            ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            'Billing details',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        Card(
                          child: Container(
                            // decoration: BoxDecoration(
                            //   border: Border.all(color: Colors.black),
                            //   borderRadius: BorderRadius.all(
                            //     Radius.circular(10),
                            //   ),
                            // ),
                            child: Column(children: [
                              ListTile(
                                leading: Text('First Name:'),
                                trailing: Text(
                                    widget.retrieveOrder.billing.firstName),
                              ),
                              ListTile(
                                leading: Text('Last Name:'),
                                trailing:
                                    Text(widget.retrieveOrder.billing.lastName),
                              ),
                              ListTile(
                                leading: Text('Phone Number:'),
                                trailing:
                                    Text(widget.retrieveOrder.billing.phone),
                              ),
                              ListTile(
                                leading: Text('Address 1:'),
                                trailing:
                                    Text(widget.retrieveOrder.billing.address1),
                              ),
                              ListTile(
                                leading: Text('Address 2:'),
                                trailing:
                                    Text(widget.retrieveOrder.billing.address2),
                              ),
                              ListTile(
                                leading: Text('City:'),
                                trailing:
                                    Text(widget.retrieveOrder.billing.city),
                              ),
                              ListTile(
                                leading: Text('State:'),
                                trailing:
                                    Text(widget.retrieveOrder.billing.state),
                              ),
                              ListTile(
                                leading: Text('Postal Code:'),
                                trailing:
                                    Text(widget.retrieveOrder.billing.postcode),
                              ),
                              ListTile(
                                leading: Text('Country:'),
                                trailing:
                                    Text(widget.retrieveOrder.billing.country),
                              ),
                            ]),
                          ),
                        ),
                        widget.retrieveOrder.status.contains('pending')
                            ? DefaultButton(
                                text: 'Pay Again',
                                press: () {
                                  try {
                                    setState(() {
                                      if (isloading == false) {
                                        isloading = !isloading;
                                      }
                                    });
                                    // postOrder(
                                    //   fname: widget
                                    //       .retrieveOrder.billing.firstName,
                                    //   lname:
                                    //       widget.retrieveOrder.billing.lastName,
                                    //   // email: email.text,
                                    //   city: widget.retrieveOrder.billing.city,
                                    //   country:
                                    //       widget.retrieveOrder.billing.city,
                                    //   state: widget
                                    //       .retrieveOrder.billing.billingState,
                                    //   phoneNo:
                                    //       widget.retrieveOrder.billing.phone,
                                    //   postCode:
                                    //       widget.retrieveOrder.billing.postcode,
                                    //   address1:
                                    //       widget.retrieveOrder.billing.address1,
                                    //   address2:
                                    //       widget.retrieveOrder.billing.address2,
                                    //   fnameS: widget
                                    //       .retrieveOrder.shipping.firstName,
                                    //   lnameS: widget
                                    //       .retrieveOrder.shipping.lastName,
                                    //   cityS: widget.retrieveOrder.shipping.city,
                                    //   countryS:
                                    //       widget.retrieveOrder.shipping.country,
                                    //   stateS: widget
                                    //       .retrieveOrder.shipping.shippingState,
                                    //   address1S: widget
                                    //       .retrieveOrder.shipping.address1,
                                    //   address2S: widget
                                    //       .retrieveOrder.shipping.address2,
                                    //   postCodeS: widget
                                    //       .retrieveOrder.shipping.postcode,
                                    // ).whenComplete(() {
                                    //   // Get.to(() => CheckoutMethodSelectable());
                                    //   setState(() {
                                    //     if (isloading == true) {
                                    //       isloading = false;
                                    //     }
                                    //   });
                                    //   // _processPayment();
                                    // });
                                    // Navigator.pop(context);
                                  } catch (e) {
                                    // showError(e);
                                  }
                                  // _processPayment();
                                })
                            : Container(),
                        SizedBox(height: 20)
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  // void _processPayment() {
  //   try {
  //     String userEmail = box.read('email');
  //     PaystackPayManager(context: context)
  //       // Don't store your secret key on users device.
  //       // Make sure this is retrive from your server at run time
  //       ..setSecretKey("sk_test_67e5e200445c3fdd49dba76b09cb6fc9db6b065b")
  //       //accepts widget
  //       ..setCompanyAssetImage(Image(
  //         image: AssetImage("assets/logos/u&u LOGO_512.png"),
  //       ))
  //       ..setAmount(int.parse(widget.retrieveOrder.total).round() * 100)
  //       // ..setReference("your-unique-transaction-reference")
  //       ..setReference(DateTime.now().millisecondsSinceEpoch.toString())
  //       ..setCurrency("NGN")
  //       ..setEmail("$userEmail")
  //       ..setFirstName("${widget.retrieveOrder.billing.firstName}")
  //       ..setLastName("${widget.retrieveOrder.billing.lastName}")
  //       ..setMetadata(
  //         {
  //           "custom_fields": [
  //             {
  //               "value": "snapTask",
  //               "display_name": "Payment to",
  //               "variable_name": "payment_to"
  //             }
  //           ]
  //         },
  //       )
  //       ..onSuccesful(_onPaymentSuccessful)
  //       ..onPending(_onPaymentPending)
  //       ..onFailed(_onPaymentFailed)
  //       ..onCancel(_onPaymentCancelled)
  //       ..initialize();
  //   } catch (error) {
  //     print("Payment Error ==> $error");
  //   }
  // }

  // void _onPaymentSuccessful(Transaction transaction) {
  //   if (transaction.message.contains('Approved')) {
  //     print('all done');
  //     print('this is working');
  //     // showDialog(context: context);

  //     String orderId = box.read('orderId');
  //     print(orderId);
  //     _showDialog();
  //     updateOrderRequest(
  //             // orderId: createOrderController.orderArray[0].data.orderId,
  //             // status: 'completed',
  //             orderId: orderId)
  //         .whenComplete(() {
  //       box.remove('orderId');
  //       print('all done');

  //       // setState(() {
  //       //   orderMade = !orderMade;
  //       // });
  //     });
  //   }
  //   print("Transaction was successful");
  //   print("Transaction Message ===> ${transaction.message}");
  //   print("Transaction Refrence ===> ${transaction.refrenceNumber}");
  // }

  // void _onPaymentPending(Transaction transaction) {
  //   print("Transaction is pendinng");
  //   print("Transaction Refrence ===> ${transaction.refrenceNumber}");
  // }

  // void _onPaymentFailed(Transaction transaction) {
  //   print("Transaction failed");
  //   print("Transaction Message ===> ${transaction.message}");
  //   _showErrorDialog();
  // }

  // void _onPaymentCancelled(Transaction transaction) {
  //   print("Transaction was cancelled");
  // }

}

class LineItemes extends StatelessWidget {
  const LineItemes(
      {Key? key,
      required this.image,
      required this.itemName,
      required this.price})
      : super(key: key);
  final String image, itemName, price;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: getProportionateScreenHeight(80),
            width: getProportionateScreenWidth(80),
            decoration: BoxDecoration(
              // color: kPrimaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Image.network(image),
          ),
          Column(children: [
            Expanded(
                child: Container(
              width: 150,
              child:
                  Text(itemName, style: TextStyle(fontWeight: FontWeight.bold)),
            )),
            Expanded(
              child: Text(price,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: kPrimaryColor)),
            ),
          ]),
        ],
      )),
    );
  }
}
