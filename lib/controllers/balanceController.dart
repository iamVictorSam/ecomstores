import 'package:ecomstore/data_layer/wallet.dart';
import 'package:get/get.dart';

class GetBalance extends GetxController {
  var balance = '0'.obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchBalance();
  }

  void fetchBalance() async {
    isLoading(true);
    try {
      var getBalance = await Wallet().checkBallance();
      if (getBalance != null) {
        balance.value = getBalance;

        // events.assignAll(eventResult) as List<Welcome>;
        // print(getAllProducts);
      }
    } finally {
      isLoading(false);
    }
  }
}
