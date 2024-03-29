import 'dart:convert';
import 'package:ecomstore/data_layer/models/all_categories.dart';
import 'package:ecomstore/data_layer/models/all_products.dart';
import 'package:ecomstore/helper/baseController.dart';
import 'package:ecomstore/services/base_client.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'models/cate_products.dart';

// import 'package:get_storage/get_storage.dart';

class ProductsController with BaseController {
// Get
  Future getAllProducts() async {
    // showLoading('Fetching data...');
    var response = await BaseClient()
        .get(
          '/api/v1/wp/products',
        )
        .catchError(handleError);
    if (response == null) return;
    // hideLoading();

    final result = jsonDecode(response) as Map;

    final data = result['data'] as List;
    final datu = jsonEncode(data);
    return allProductsFromJson(datu);
  }

  Future getAllCategories() async {
    // showLoading('Fetching data...');
    var response = await BaseClient()
        .get(
          '/api/v1/wp/products/main/categories',
        )
        .catchError(handleError);
    if (response == null) return;
    // hideLoading();

    final result = jsonDecode(response) as Map;

    final data = result['categories'] as List;
    print(data);
    final datu = jsonEncode(data);
    return categoriesFromJson(datu);
  }

  Future getAllCategoriesProduct() async {
    // showLoading('Fetching data...');
    var id = GetStorage().read('cateId');
    print('this is id $id');
    var response = await BaseClient()
        .get(
          '/api/v1/wp/products/main/categories/$id',
        )
        .catchError(handleError);
    if (response == null) return;
    // hideLoading();
    print(response);

    final result = jsonDecode(response) as Map;

    final data = result['products'] as List;
    print(data);
    final datu = jsonEncode(data);
    return categoryProductFromJson(datu);
  }
}
