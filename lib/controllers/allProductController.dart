import 'package:ecomstore/data_layer/models/all_products.dart';
import 'package:ecomstore/data_layer/productsController.dart';
import 'package:get/get.dart';

class GetAllProductsController extends GetxController {
  var getAllProducts = <AllProducts>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllProduct();
  }

  void fetchAllProduct() async {
    isLoading(true);
    try {
      var getAllProductResult = await ProductsController().getAllProducts();
      if (getAllProductResult != null) {
        getAllProducts.value =
            getAllProductResult; // events.assignAll(eventResult) as List<Welcome>;
        // print(getAllProducts);
      }
    } finally {
      isLoading(false);
    }
  }
}
