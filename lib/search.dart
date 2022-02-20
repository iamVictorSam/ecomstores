import 'package:ecomstore/components/product_card.dart';
import 'package:ecomstore/constants.dart';
import 'package:ecomstore/controllers/cateProdController.dart';
import 'package:ecomstore/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsSearch extends SearchDelegate<String> {
  final productController = Get.put(GetAllCatProductsController());

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: () => query = ''),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, '');
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(10),
            vertical: getProportionateScreenHeight(10)),
        child: Container(
          child: GestureDetector(
            onTap: () => showResults(context),
            child: GridView.builder(
              itemCount: productController.getAllProducts.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 70,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Wrap(children: [
                  ProductCard(product: productController.getAllProducts[index]),
                ]);
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final searches = query.isEmpty
        ? productController.getAllProducts
        : productController.getAllProducts
            .where((p) => p.productName.startsWith(query))
            .toList();

    // return searches.isEmpty
    // ? Center(
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         CircleAvatar(radius: 80, child: Icon(EvaIcons.close)),
    //         Text('No Results Found',
    //             style: TextStyle(
    //                 fontSize: getProportionateScreenHeight(22),
    //                 fontWeight: FontWeight.bold))
    //       ],
    //     ),
    //   )
    // :
    return ListView.builder(
      itemCount: productController.getAllProducts.length,
      itemBuilder: (context, index) => ListTile(
        leading: Container(
          height: 60,
          width: 50,
          child: Image.network(
            productController.getAllProducts[index].productImages[0].src,
          ),
        ),
        title: RichText(
          text: TextSpan(
            text: productController.getAllProducts[index].productName
                .substring(0, query.length),
            style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                  text: productController.getAllProducts[index].productName
                      .substring(0, query.length),
                  style: TextStyle(color: Colors.grey))
            ],
          ),
        ),
      ),
    );
    // : Container(
    //     child: Padding(
    //       padding: EdgeInsets.symmetric(
    //           horizontal: getProportionateScreenWidth(10),
    //           vertical: getProportionateScreenHeight(10)),
    //       child: Container(
    //         child: GestureDetector(
    //           onTap: () => showResults(context),
    //           child: GridView.builder(
    //             itemCount: productController.products.length,
    //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //               crossAxisCount: 2,
    //               mainAxisSpacing: 70,
    //             ),
    //             itemBuilder: (BuildContext context, int index) {
    //               return Wrap(children: [
    //                 ProductCard(product: productController.products[index]),
    //               ]);
    //             },
    //           ),
    //         ),
    //       ),
    //     ),
    //   );
  }
}
