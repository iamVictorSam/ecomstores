import 'package:ecomstore/data_layer/models/all_products.dart';
import 'package:get/state_manager.dart';

class CartController extends GetxController {
  // ignore: deprecated_member_use
  var cartItems = [].obs;

  int get cartCount => cartItems.length;

  // totolPrice = 0;

  populate() {
    var checkout = [];
    for (var i = 0; i < cartCount; i++) {
      int id = cartItems[cartCount].price;
      int quantity = int.parse(cartItems[cartCount].stockQuantity);
      dynamic details = {"product_id": id, "quantity": quantity};
      checkout.add(details);
    }
    return checkout;
  }

  double get totalPrice =>
      cartItems.fold(0, (sum, item) => sum + int.parse(item.price));

  addToCart(product) {
    cartItems.add(product);
  }

  addRecentlyToCart(AllProducts product) {
    cartItems.add(product);
  }

  removeItems() {
    cartItems.clear();
  }
}
