import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:e_commerce/logic/controller/theme_controller.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: Text(
                'Change Mode',
                style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : blackColor),
              ),
              onPressed: () {
                ThemeController().changeTheme();
              },
            ),
            SizedBox(
              height: 20,
            ),
            GetBuilder<AuthController>(
              builder: (controller) {
                return TextButton(
                  child: Text(
                    'Log Out',
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : blackColor),
                  ),
                  onPressed: () {
                    Get.defaultDialog(
                      title: 'Log Out From App',
                      titleStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      middleText: 'Are you sure you need to logout ',
                      middleTextStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      backgroundColor: Colors.grey,
                      radius: 10,
                      textCancel: 'NO',
                      cancelTextColor:Get.isDarkMode ? Colors.white : blackColor,
                      textConfirm: 'YES',
                      confirmTextColor: Get.isDarkMode ? Colors.white : blackColor,
                      onCancel: (){
                        Get.back();
                      },
                      onConfirm: (){
                        controller.signOutFromApp();
                      },
                      buttonColor:Get.isDarkMode? pinkColor:mainColor ,
                    );

                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
