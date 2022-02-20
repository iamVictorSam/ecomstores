import 'package:ecomstore/controllers/categoriesController.dart';
import 'package:ecomstore/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../home/components/home_header.dart';

class SpecialOfferSeeAll extends StatelessWidget {
  final box = GetStorage();
  final cateController = Get.put(GetAllCategoriesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(20)),
              HomeHeader(),
              SizedBox(height: getProportionateScreenWidth(10)),
              SingleChildScrollView(
                child: Expanded(child: Obx(() {
                  if (cateController.isLoading.value)
                    return Center(child: CircularProgressIndicator());
                  else
                    return Column(children: [
                      ...List.generate(cateController.getAllcategories.length,
                          (index) {
                        return SpecialOfferAllCard(
                          category: cateController.getAllcategories[index].name,
                          image: cateController.getAllcategories[index].image ==
                                  null
                              ? ''
                              : cateController.getAllcategories[index].image,
                          numOfBrands:
                              cateController.getAllcategories[index].count == 0
                                  ? 1
                                  : cateController
                                      .getAllcategories[index].count,
                          press: () {
                            box.write('cateId',
                                cateController.getAllcategories[index].id);
                            print('${box.read('cateId')} from home');
                            Future.delayed(Duration(seconds: 1), () {
                              // Get.to(() => CategoriesScreen(
                              //       micate: cateController.categories[index],
                              //     ));
                            });
                          },
                        );
                      }),
                      SizedBox(width: getProportionateScreenWidth(20)),
                    ]);
                })),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SpecialOfferAllCard extends StatelessWidget {
  const SpecialOfferAllCard({
    Key? key,
    required this.category,
    required this.image,
    required this.numOfBrands,
    required this.press,
  }) : super(key: key);

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: getProportionateScreenWidth(20),
          right: getProportionateScreenWidth(20),
          top: getProportionateScreenHeight(12)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: double.infinity,
          height: getProportionateScreenHeight(130),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                // Image.network(
                //   image,
                //   fit: BoxFit.fitWidth,
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
                            fontSize: getProportionateScreenWidth(22),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "$numOfBrands Brands",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            // fontWeight: FontWeight.bold,
                          ),
                        )
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
