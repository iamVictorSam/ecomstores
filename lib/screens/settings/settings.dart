// import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:ecomstore/constants.dart';
import 'package:ecomstore/controllers/userInforController.dart';
import 'package:ecomstore/data_layer/models/user_info.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';

class Settings extends StatelessWidget {
  bool _isOpen = false;
  // PanelController _panelController = PanelController();
  String? age;
  String? gender;

  final userInfo = Get.put(GetUserInfoController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          appBar: AppBar(
            title: Text('Profile',
                style: TextStyle(
                  color: Colors.black,
                )),
          ),
          body: userInfo.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),

                      //   ],
                      // )),

                      biilingInfo(user: userInfo.getUserInfo[0]),
                    ]),
                  ),
                ),
        ));
  }
}

Widget shadowCard({Widget? child}) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
    child: child,
  );
}

Widget biilingInfo({required UserInfo user}) {
  return Column(
    children: [
      shadowCard(
          child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          ListTile(
            title: Text('Username'),
            trailing: Text(user.data.username),
          ),
          ListTile(
            title: Text('First Name'),
            trailing: Text(user.data.firstName),
          ),
          ListTile(
            title: Text('Last Name'),
            trailing: Text(user.data.lastName),
          ),
        ],
      )),
      SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Text(
          'Shipping details',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      shadowCard(
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
              trailing: Text(user.data.shipping.firstName),
            ),
            ListTile(
              leading: Text('Last Name:'),
              trailing: Text(user.data.shipping.lastName),
            ),
            ListTile(
              leading: Text('Address 1:'),
              trailing: Text(user.data.shipping.address1),
            ),
            ListTile(
              leading: Text('Address 2:'),
              trailing: Text(user.data.shipping.address2),
            ),
            ListTile(
              leading: Text('City:'),
              trailing: Text(user.data.shipping.city),
            ),
            ListTile(
              leading: Text('State:'),
              trailing: Text(user.data.shipping.state),
            ),
            ListTile(
              leading: Text('Postal Code:'),
              trailing: Text(user.data.shipping.postcode),
            ),
            ListTile(
              leading: Text('Country:'),
              trailing: Text(user.data.shipping.country),
            ),
          ]),
        ),
      ),
      SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Text(
          'Billing details',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      shadowCard(
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
              trailing: Text(user.data.billing.firstName),
            ),
            ListTile(
              leading: Text('Last Name:'),
              trailing: Text(user.data.billing.lastName),
            ),
            ListTile(
              leading: Text('Phone Number:'),
              trailing: Text(user.data.billing.phone),
            ),
            ListTile(
              leading: Text('Address 1:'),
              trailing: Text(user.data.billing.address1),
            ),
            ListTile(
              leading: Text('Address 2:'),
              trailing: Text(user.data.billing.address2),
            ),
            ListTile(
              leading: Text('City:'),
              trailing: Text(user.data.billing.city),
            ),
            ListTile(
              leading: Text('State:'),
              trailing: Text(user.data.billing.state),
            ),
            ListTile(
              leading: Text('Postal Code:'),
              trailing: Text(user.data.billing.postcode),
            ),
            ListTile(
              leading: Text('Country:'),
              trailing: Text(user.data.billing.country),
            ),
          ]),
        ),
      ),
    ],
  );
}
