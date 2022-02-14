// import 'package:credit_card/credit_card_form.dart';
// import 'package:credit_card/credit_card_model.dart';
// import 'package:credit_card/credit_card_widget.dart';
// import 'package:eva_icons_flutter/eva_icons_flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// // import 'package:shop_app/screens/checkOut/checkOutScreen.dart';
// import 'package:shop_app/screens/checkOut/components/Purchased.dart';
// import 'package:shop_app/components/default_button1.dart';
// import 'package:shop_app/constants.dart';

// class CardDetailsScreen extends StatefulWidget {
//   @override
//   _CardDetailsScreenState createState() => _CardDetailsScreenState();
// }

// class _CardDetailsScreenState extends State<CardDetailsScreen> {
//   void onModelChange(CreditCardModel model) {
//     setState(() {
//       cardNumber = model.cardNumber;
//       expiryDate = model.expiryDate;
//       cardHolderName = model.cardHolderName;
//       cvvCode = model.cvvCode;
//       isCvvFucused = model.isCvvFocused;
//     });
//   }

//   String cardNumber = '';
//   String expiryDate = '';
//   String cardHolderName = '';
//   String cvvCode = '';
//   bool isCvvFucused = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Checkout')),
//       body: Container(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               // crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child: Icon(
//                     Icons.location_on,
//                     size: 32,
//                     color: kPrimaryColor,
//                   ),
//                 ),
//                 Row(
//                   children: List.generate(
//                     3,
//                     (index) => Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 10),
//                       child: Container(
//                         height: 5,
//                         width: 5,
//                         decoration: BoxDecoration(
//                           color: kPrimaryColor,
//                           shape: BoxShape.circle,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child: Icon(
//                     EvaIcons.creditCard,
//                     size: 35,
//                     color: kPrimaryColor,
//                   ),
//                 ),
//                 Row(
//                   children: List.generate(
//                     3,
//                     (index) => Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 10),
//                       child: Container(
//                         height: 5,
//                         width: 5,
//                         decoration: BoxDecoration(
//                           color: Colors.blueGrey,
//                           shape: BoxShape.circle,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child: Icon(
//                     EvaIcons.checkmarkCircle2,
//                     size: 28,
//                     color: Colors.blueGrey,
//                   ),
//                 ),
//               ],
//             ),
//             // SizedBox(
//             //   height: 15,
//             // ),
//             Padding(
//               padding: const EdgeInsets.only(left: 35.0),
//               child: Text(
//                 'Step 2',
//                 style: TextStyle(fontSize: 14),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 35.0),
//               child: Text(
//                 'Payment',
//                 style: TextStyle(
//                     fontSize: 22,
//                     color: kPrimaryColor,
//                     fontWeight: FontWeight.w600),
//               ),
//             ),
//             SizedBox(
//               height: 8,
//             ),
//             // SizedBox(
//             //   height: 20,
//             // ),
//             CreditCardWidget(
//               cardNumber: cardNumber,
//               expiryDate: expiryDate,
//               cardHolderName: cardHolderName,
//               cvvCode: cvvCode,
//               showBackView: isCvvFucused,
//               height: 195,
//               width: MediaQuery.of(context).size.width,
//               animationDuration: Duration(milliseconds: 1000),
//             ),

//             SizedBox(
//               height: 7,
//             ),
//             Expanded(
//                 child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   CreditCardForm(onCreditCardModelChange: onModelChange),
//                   SizedBox(
//                     height: 8,
//                   ),

//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
//                     child: DefaultButton(press:  () => Get.to(() => Purchased()), text: 'Proceed'),
//                   )
//                 ]
//               )
//             )),

//             // Padding(
//             //   padding: const EdgeInsets.symmetric(horizontal: 30.0),
//             //   child: FloatingActionButton.extended(
//             //     onPressed: () => Get.to(() => Purchased()),
//             //     label: Padding(
//             //       padding: const EdgeInsets.symmetric(horizontal: 40.0),
//             //       child: Text(
//             //         'Continue To Payment',
//             //         style: TextStyle(
//             //             color: Colors.white, fontWeight: FontWeight.w600),
//             //       ),
//             //     ),
//             //     foregroundColor: kPrimaryColor,
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
