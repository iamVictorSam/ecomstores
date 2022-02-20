import 'package:ecomstore/screens/verification.dart';
import 'package:flutter/material.dart';
import 'package:ecomstore/routes.dart';
import 'package:ecomstore/screens/profile/profile_screen.dart';
import 'package:ecomstore/screens/splash/splash_screen.dart';
import 'package:ecomstore/theme.dart';
import 'package:flutter_paystack_client/flutter_paystack_client.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();

  WidgetsFlutterBinding.ensureInitialized();
  await PaystackClient.initialize(
      'pk_test_d094408d5fd048bc50fa9f99c599ff7986655b68');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      initialRoute: VerificationScreen.routeName,
      routes: routes,
    );
  }
}
