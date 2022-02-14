import 'package:ecomstore/screens/sign_in/sign_in_screen.dart';
import 'package:get/get.dart';
import 'package:ecomstore/helper/custom_dialog.dart';
import 'package:ecomstore/services/app_exceptions.dart';

class BaseController {
  void handleError(error) {
    hideLoading();
    if (error is BadRequestException) {
      // var message = error.message;
      var message = 'Cannot process the request\nPlease check details ';
      DialogHelper.showErrorDialog(
          desc: message,
          press: () {
            if (Get.isDialogOpen!) Get.back();
          });
    } else if (error is ApiNotRespondingException) {
      var message = 'The server taking too long';
      DialogHelper.showErrorDialog(
          desc: message,
          press: () {
            if (Get.isDialogOpen!) Get.back();
          });
    } else if (error is FetchDataException) {
      var message = error.message;
      DialogHelper.showErrorDialog(
          desc: message,
          press: () {
            if (Get.isDialogOpen!) Get.back();
          });
    } else if (error is UnAuthorizedException) {
      var message = error.message;
      DialogHelper.showErrorDialog(
          desc: message,
          press: () {
            if (Get.isDialogOpen!) Get.back();
            // Get.offAll(LoginScreen());
          });
    } else if (error is ServerException) {
      var message = 'Sorry the server is too busy';
      DialogHelper.showErrorDialog(
          title: 'Server TimeOut',
          desc: message,
          press: () {
            if (Get.isDialogOpen!) Get.back();
            Get.offAll(SignInScreen());
          });
    } else if (error is UnprocessableEntity) {
      var message = 'Please input correct details';
      DialogHelper.showErrorDialog(
          title: 'Details Invalid',
          desc: message,
          press: () {
            if (Get.isDialogOpen!) Get.back();
            Get.offAll(SignInScreen());
          });
    } else if (error is PageNotFoundException) {
      var message = 'Manifest not found, please try again';
      DialogHelper.showErrorDialog(
          title: 'Invalid ManifestCode',
          desc: message,
          press: () {
            if (Get.isDialogOpen!) Get.back();
            // Get.offAll(LoginScreen());
          });
    }
  }
  // manifest not found, please try again!

  showLoading([String? message]) {
    DialogHelper?.showLoading(message!);
  }

  hideLoading() {
    DialogHelper.hideDialog();
  }
}