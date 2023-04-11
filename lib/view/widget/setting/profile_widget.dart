import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:e_commerce/view/widget/text_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controller/setting_controller.dart';

class ProfileImage extends StatelessWidget {
   ProfileImage({Key? key}) : super(key: key);
final controller = Get.find<SettingController>();
final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

           Row(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://firebasestorage.googleapis.com/v0/b/social-4984d.appspot.com/o/users%2Fsaeed7.jpeg?alt=media&token=a9f49079-f235-44b2-9a19-0fcd77680ca6'),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  text: controller.capitalize('saeed bark saeed'),
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underline: TextDecoration.none,
                ),
                TextUtils(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  text: 'SaeedBark@gmail.com',
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underline: TextDecoration.none,
                ),
              ],
            )
          ],


      ),
      ],
    );
  }
}
