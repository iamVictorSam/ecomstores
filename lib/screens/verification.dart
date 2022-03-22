import 'package:ecomstore/screens/home/home_screen.dart';
import 'package:ecomstore/screens/splash/splash_screen.dart';
import 'package:ecomstore/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
  static String routeName = "/verification";
}

class _VerificationScreenState extends State<VerificationScreen> {
  bool checkAuth = false;
  final box = GetStorage();

  @override
  void initState() {
    super.initState();

    if (box.hasData('username') == true) {
      setState(() {
        checkAuth = true;
      });
    }

    // setState(() {
    //   checkAuth = true;
    // });

    // this.checkAuthentification();
    // setState(() {
    //   checkAuth = false;
    // });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(body: checkAuth == false ? SplashScreen() : HomeScreen());
  }
}
