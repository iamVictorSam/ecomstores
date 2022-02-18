import 'package:ecomstore/data_layer/models/all_categories.dart';
import 'package:ecomstore/data_layer/models/order_details.dart';
import 'package:ecomstore/data_layer/orders.dart';
import 'package:ecomstore/data_layer/productsController.dart';
import 'package:get/get.dart';

class GetOrderDetailsController extends GetxController {
  var getOrders = <RetrieveOrders>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchOrderDetails();
  }

  void fetchOrderDetails() async {
    isLoading(true);
    try {
      var getOrderDetailsResult = await OrdersControlller().getOrderDetails();
      if (getOrderDetailsResult != null) {
        getOrders.value =
            getOrderDetailsResult; // events.assignAll(eventResult) as List<Welcome>;
        // print(getOrders);
      }
    } finally {
      isLoading(false);
    }
  }
}
