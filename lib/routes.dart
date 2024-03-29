import 'package:ecomstore/screens/verification.dart';
import 'package:flutter/widgets.dart';
import 'package:ecomstore/screens/cart/cart_screen.dart';
import 'package:ecomstore/screens/complete_profile/complete_profile_screen.dart';
import 'package:ecomstore/screens/details/details_screen.dart';
import 'package:ecomstore/screens/forgot_password/forgot_password_screen.dart';
import 'package:ecomstore/screens/home/home_screen.dart';
import 'package:ecomstore/screens/login_success/login_success_screen.dart';
import 'package:ecomstore/screens/otp/otp_screen.dart';
import 'package:ecomstore/screens/profile/profile_screen.dart';
import 'package:ecomstore/screens/sign_in/sign_in_screen.dart';
import 'package:ecomstore/screens/splash/splash_screen.dart';

import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  VerificationScreen.routeName: (context) => VerificationScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
};
