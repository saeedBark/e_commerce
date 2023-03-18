import 'package:e_commerce/logic/bindings/aut_biniding.dart';
import 'package:e_commerce/logic/bindings/main_binding.dart';
import 'package:e_commerce/logic/bindings/product_biniding.dart';
import 'package:e_commerce/view/screens/auth/forgot_password_screen.dart';
import 'package:e_commerce/view/screens/auth/login_screen.dart';
import 'package:e_commerce/view/screens/auth/signup_screen.dart';
import 'package:e_commerce/view/screens/cart_screen.dart';
import 'package:e_commerce/view/screens/main_screen.dart';
import 'package:e_commerce/view/screens/welcome_screen.dart';
import 'package:get/get.dart';

class AppRoute {
  static const welcom = Routes.welcomeScreen;
  static const mainscreen = Routes.mainScreen;

  static final routes = [
    GetPage(
      name: Routes.welcomeScreen,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signupScreen,
      page: () => SignupScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgetScreen,
      page: () => ForgetScreen(),
      binding: AuthBinding(),
    ),
    GetPage(name: Routes.mainScreen, page: () => MainScreen(), bindings: [
      AuthBinding(),
      MainBainding(),
      ProductBinding(),
    ]),
    GetPage(
      name: Routes.cartScreen,
      page: () => CartScreen(),
      bindings:[
        AuthBinding(),
        ProductBinding(),
      ],
    ),
  ];
}

class Routes {
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signupScreen = '/signupScreen';
  static const forgetScreen = '/forgetScreen';
  static const mainScreen = '/mainScreen';
  static const cartScreen = '/cartScreen';
}
