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
                    controller.signOutFromApp();
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
