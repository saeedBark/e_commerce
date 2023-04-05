import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/theme.dart';
import '../text_util.dart';

class LogOutWidget extends StatelessWidget {
  LogOutWidget({Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_) => Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Get.defaultDialog(
            title: 'Log Out From App',
            titleStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            middleText: 'Are you sure you need to logout ',
            middleTextStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            backgroundColor: Colors.grey,
            radius: 10,
            textCancel: 'NO',
            cancelTextColor: Get.isDarkMode ? Colors.white : blackColor,
            textConfirm: 'YES',
            confirmTextColor: Get.isDarkMode ? Colors.white : blackColor,
            onCancel: () {
              Get.back();
            },
            onConfirm: () {
              controller.signOutFromApp();
            },
            buttonColor: Get.isDarkMode ? pinkColor : mainColor,
          );
        },
        splashColor: Get.isDarkMode ? pinkColor : mainColor,
        borderRadius: BorderRadius.circular(12),
        customBorder: StadiumBorder(),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: logOutSettting,
              ),
              child: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            TextUtils(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              text: 'Logout',
              color: Get.isDarkMode ? Colors.white : Colors.black,
              underline: TextDecoration.none,
            ),
          ],
        ),
      ),
    ),);
  }
}
