import 'package:ecomstore/data_layer/models/all_categories.dart';
import 'package:ecomstore/data_layer/productsController.dart';
import 'package:get/get.dart';

class GetAllCategoriesController extends GetxController {
  var getAllcategories = <Categories>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllCategories();
  }

  void fetchAllCategories() async {
    isLoading(true);
    try {
      var getAllCategoriesResult =
          await ProductsController().getAllCategories();
      if (getAllCategoriesResult != null) {
        getAllcategories.value =
            getAllCategoriesResult; // events.assignAll(eventResult) as List<Welcome>;
        // print(getAllcategories);
      }
    } finally {
      isLoading(false);
    }
  }
}
