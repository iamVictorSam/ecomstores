import 'package:ecomstore/constants.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    Key? key,
    required this.orderCode,
    required this.time,
    required this.price,
    required this.orderStatus,
    required this.onPressed,
  }) : super(key: key);
  final String orderCode, time, price, orderStatus;
  final GestureTapCallback onPressed;
  // final RetrieveOrdersController rOdersController =
  // Get.put(RetrieveOrdersController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: FlatButton(
        onPressed: onPressed,
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      orderCode,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          letterSpacing: 1.2,
                          color: kPrimaryColor),
                    ),
                  ),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Order status',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          orderStatus,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Expanded(
                  //       child: Text(
                  //         'Items',
                  //         style: TextStyle(
                  //           fontSize: 16,
                  //         ),
                  //       ),
                  //     ),
                  //     Expanded(
                  //       child: Text(
                  //         ,
                  //         style: TextStyle(
                  //           color: Colors.black,
                  //           fontSize: 16,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Price',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          price,
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
