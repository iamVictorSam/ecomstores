import 'package:ecomstore/data_layer/models/all_products.dart';
import 'package:ecomstore/data_layer/models/cate_products.dart';
import 'package:ecomstore/data_layer/productsController.dart';
import 'package:get/get.dart';

class GetAllCatProductsController extends GetxController {
  var getAllProducts = <CategoryProduct>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllProduct();
  }

  @override
  void dispose() {
    fetchAllProduct();
    super.dispose();
  }

  void fetchAllProduct() async {
    isLoading(true);
    try {
      var getAllProductResult =
          await ProductsController().getAllCategoriesProduct();
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
