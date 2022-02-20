import 'package:ecomstore/constants.dart';
import 'package:ecomstore/data_layer/models/all_products.dart';
import 'package:ecomstore/data_layer/models/cate_products.dart';
import 'package:ecomstore/screens/details/details_screen.dart';
import 'package:ecomstore/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewCateProductCard extends StatelessWidget {
  //  favController = Get.put(FavController());

  ViewCateProductCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.product,
  }) : super(key: key);

  final double width, aspectRetio;
  final AllProducts product;
  // final favController = Get.put(FavController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              DetailsScreen.routeName,
              arguments: ProductDetailsArguments(product: product),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Image.network(
                    product.productImages[0].src,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                product.productName,
                style: TextStyle(color: Colors.black, fontSize: 16.5),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "N${product.price}",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                  // InkWell(
                  //   borderRadius: BorderRadius.circular(50),
                  //   onTap: () {
                  //     product.isFavourite.toggle().isTrue
                  //         ? favController.addToFav(product)
                  //         : favController.removeFromFav(product);
                  //   },
                  //   child: Obx(() => Container(
                  //         padding:
                  //             EdgeInsets.all(getProportionateScreenWidth(8)),
                  //         height: getProportionateScreenWidth(28),
                  //         width: getProportionateScreenWidth(28),
                  //         decoration: BoxDecoration(
                  //           color: product.isFavourite.value
                  //               ? kPrimaryColor.withOpacity(0.15)
                  //               : kSecondaryColor.withOpacity(0.1),
                  //           shape: BoxShape.circle,
                  //         ),
                  //         child: SvgPicture.asset(
                  //           "assets/icons/Heart Icon_2.svg",
                  //           color: product.isFavourite.value
                  //               ? Color(0xFFFF4848)
                  //               : Color(0xFFDBDEE4),
                  //         ),
                  //       )),
                  // ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
