import 'package:ecomstore/components/default_button.dart';
import 'package:ecomstore/controllers/cartController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

// import 'package:shop_app/models/Product.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return cartController.cartItems.length == 0
        ? Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'No Products Here',
              style: TextStyle(fontSize: 30, color: kPrimaryColor),
            ),
            Container(
              height: getProportionateScreenHeight(300),
              width: getProportionateScreenWidth(400),
              child: Image.network('https://i.imgur.com/kl9X3Gn.png'),
            ),
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: DefaultButton(
                  // press: () => Get.to(() => SeeAll()),
                  press: () {},
                  text: 'Find Products Here'),
            )
          ])
        // Container(
        //     child: Center(child: Column(children: [
        //       Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: Text('No Item Available In this Category', style: TextStyle(fontSize: 20)),
        //       ),
        //       DefaultButton(press: ()=>Get.to(()=>SeeAll()), text: 'Browse product')
        //     ],),)
        // )
        : Obx(() => Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: ListView.builder(
                itemCount: cartController.cartItems.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Dismissible(
                    key: Key(cartController.cartItems.toString()),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      setState(() {
                        cartController.cartItems.removeAt(index);
                      });
                    },
                    background: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFE6E6),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Spacer(),
                          SvgPicture.asset("assets/icons/Trash.svg"),
                        ],
                      ),
                    ),
                    child: CartCard(cart: cartController.cartItems[index]),
                  ),
                ),
              ),
            ));
  }
}
