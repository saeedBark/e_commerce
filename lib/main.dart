import 'package:e_commerce/logic/controller/theme_controller.dart';
import 'package:e_commerce/utils/routes/routes.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const Ecommerce());
}

class Ecommerce extends StatelessWidget {
  const Ecommerce({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop app',
      theme: ThemeApp.light,
      darkTheme: ThemeApp.dark,
      themeMode: ThemeController().themDataGet,
      initialRoute: FirebaseAuth.instance.currentUser != null ||
              GetStorage().read<bool>('saveLogin') == true
          ? AppRoute.mainscreen
          : AppRoute.welcom,
      getPages: AppRoute.routes,
    );
  }
}
