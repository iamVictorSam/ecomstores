import 'package:ecomstore/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogHelper {
  static void showErrorDialog({
    String dialogText = 'okay',
    String title = 'Error',
    String desc = 'Something went wrong',
    required GestureTapCallback press,
  }) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 15),
              Icon(
                Icons.error,
                size: 68,
                color: Colors.red,
              ),
              SizedBox(height: 15),
              Center(
                child: Text(
                  title,
                  style: Get.textTheme.headline5,
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  desc,
                  textAlign: TextAlign.center,
                  style: Get.textTheme.headline6,
                ),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                  onPressed: press,
                  style: ElevatedButton.styleFrom(primary: kSecondaryColor),
                  // onPressed: () {
                  //   if (Get.isDialogOpen!) Get.back();
                  // },
                  child: Text(dialogText, style: TextStyle(fontSize: 18)))
            ],
          ),
        ),
      ),
    );
  }

  static void showLoading([String? message]) {
    // Get.dialog(
    //   Dialog(
    //     child: Padding(
    //       padding: const EdgeInsets.all(16.0),
    //       child: Column(
    //         mainAxisSize: MainAxisSize.min,
    //         children: [
    //           CircularProgressIndicator(),
    //           Text(message!),
    //         ],
    //       ),
    //     ),
    //   ),
    // );

    // showAlertDialog(BuildContext context) {
    //   // set up the AlertDialog
    //   AlertDialog alert = AlertDialog(
    //     content: Center(
    //       child: CircularProgressIndicator(),
    //     ),
    //     actions: [],
    //   );

    //   // show the dialog
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return alert;
    //     },
    //   );
    // }

    Get.dialog(
      WillPopScope(
        child: const Center(
          child: CircularProgressIndicator(),
        ),
        onWillPop: () => Future.value(false),
      ),
      barrierDismissible: false,
      barrierColor: Color(0xff141A31).withOpacity(.3),
      useSafeArea: true,
    );
  }

  static void showSuccess([String? message]) {
    Get.dialog(
      WillPopScope(
        child: Container(
          child: Center(
            child: Column(
              children: [Text('Success')],
            ),
          ),
        ),
        onWillPop: () => Future.value(false),
      ),
      barrierDismissible: false,
      barrierColor: Color(0xff141A31).withOpacity(.3),
      useSafeArea: true,
    );
  }

  static void hideDialog() {
    Get.back();
    // Navigator.pop(context);
  }
}
