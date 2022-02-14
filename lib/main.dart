import 'package:flutter/material.dart';
import 'package:ecomstore/routes.dart';
import 'package:ecomstore/screens/profile/profile_screen.dart';
import 'package:ecomstore/screens/splash/splash_screen.dart';
import 'package:ecomstore/theme.dart';
import 'package:get/get.dart';

void main() {
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
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
