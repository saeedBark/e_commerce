import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:e_commerce/logic/controller/theme_controller.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widget/text_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/setting/darkMode_widget.dart';
import '../widget/setting/language_widget.dart';
import '../widget/setting/log_out_widget.dart';
import '../widget/setting/profile_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: ListView(
        padding: EdgeInsets.all(24),
        children: [
          ProfileImage(),
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: Get.isDarkMode ? Colors.white : Colors.grey,
            thickness: 2,
          ),
          SizedBox(
            height: 20,
          ),
          TextUtils(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            text: 'GENERAL',
            color: Get.isDarkMode ? pinkColor  : mainColor,
            underline: TextDecoration.none,
          ),
          SizedBox(height: 20,),
          DarkModeWidget(),
          SizedBox(height: 20,),
          LanguageWidget(),
          SizedBox(height: 20,),
          LogOutWidget(),
        ],
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       TextButton(
      //         child: Text(
      //           'Change Mode',
      //           style: TextStyle(
      //               color: Get.isDarkMode ? Colors.white : blackColor),
      //         ),
      //         onPressed: () {
      //           ThemeController().changeTheme();
      //         },
      //       ),
      //       const SizedBox(
      //         height: 20,
      //       ),
      //       GetBuilder<AuthController>(
      //         builder: (controller) {
      //           return TextButton(
      //             child: Text(
      //               'Log Out',
      //               style: TextStyle(
      //                   color: Get.isDarkMode ? Colors.white : blackColor),
      //             ),
      //             onPressed: () {
      //
      //
      //             },
      //           );
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
