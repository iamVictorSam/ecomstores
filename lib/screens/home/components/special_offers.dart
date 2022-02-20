import 'package:ecomstore/controllers/categoriesController.dart';
import 'package:ecomstore/controllers/userInforController.dart';
import 'package:ecomstore/screens/cateScreen/cateScreen.dart';
import 'package:ecomstore/screens/seeAllCategories/seeAllCategories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class SpecialOffers extends StatelessWidget {
  SpecialOffers({
    Key? key,
  }) : super(key: key);

  final cateCtrl = Get.put(GetAllCategoriesController());
  final userInfo = Get.put(GetUserInfoController());
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
            title: "Special for you",
            press: () => Get.to(SpecialOfferSeeAll()),
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Obx(() => Row(
                children: [
                  ...List.generate(
                      cateCtrl.getAllcategories.length,
                      (index) => SpecialOfferCard(
                            category: cateCtrl.getAllcategories[index].name,
                            numOfBrands: cateCtrl.getAllcategories[index].count,
                            // image: cateCtrl.getAllcategories[index].image == ''
                            //     ? FlutterLogo()
                            //     : cateCtrl.getAllcategories[index].image,
                            press: () {
                              box
                                  .write('cateId',
                                      cateCtrl.getAllcategories[index].id)
                                  .whenComplete(
                                      () => Get.to(CategoriesScreen()));
                              print('${box.read('cateId')} from home');
                            },
                          )),
                  // SpecialOfferCard(
                  //   image: "assets/images/Image Banner 2.png",
                  //   category: "Smartphone",
                  //   numOfBrands: 18,
                  //   press: () {},
                  // ),
                  // SpecialOfferCard(
                  //   image: "assets/images/Image Banner 3.png",
                  //   category: "Fashion",
                  //   numOfBrands: 24,
                  //   press: () {},
                  // ),
                  SizedBox(width: getProportionateScreenWidth(20)),
                ],
              )),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.category,
    // required this.image,
    required this.numOfBrands,
    required this.press,
  }) : super(key: key);

  final String category; /*image */
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(242),
          height: getProportionateScreenWidth(100),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                // Image.network(
                //   image,
                //   fit: BoxFit.cover,
                // ),
                // Container(
                //   height: 30,
                //   width: 80,
                //   color: Colors.purple,
                // ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15.0),
                    vertical: getProportionateScreenWidth(10),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "$numOfBrands Products")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
