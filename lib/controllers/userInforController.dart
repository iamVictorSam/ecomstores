import 'package:ecomstore/data_layer/models/order_details.dart';
import 'package:ecomstore/data_layer/models/user_info.dart';
import 'package:ecomstore/data_layer/orders.dart';
import 'package:ecomstore/data_layer/userInfo.dart';
import 'package:get/get.dart';

class GetUserInfoController extends GetxController {
  var getUserInfo = <UserInfo>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserInfo();
  }

  void fetchUserInfo() async {
    isLoading(true);
    try {
      var getUserInfoResult = await UserController().getUserInfo();
      if (getUserInfoResult != null) {
        getUserInfo.value =
            getUserInfoResult; // events.assignAll(eventResult) as List<Welcome>;
        print('******8888888888888 $getUserInfo');
      }
    } finally {
      isLoading(false);
    }
  }
}
