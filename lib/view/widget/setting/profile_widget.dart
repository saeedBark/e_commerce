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
     Obx(() =>    Row(
       children: [
         Container(
           height: 100,
           width: 100,
           decoration:  const BoxDecoration(
               color: Colors.white,
               shape: BoxShape.circle,
               image: DecorationImage(
                   image: NetworkImage(
                      'https://images.unsplash.com/photo-1681844931449-e0992a27d157?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0NHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60'),
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
               text: controller.capitalize(authController.displayUserName.value),
               color: Get.isDarkMode ? Colors.white : Colors.black,
               underline: TextDecoration.none,
             ),
             TextUtils(
               fontSize: 14,
               fontWeight: FontWeight.bold,
               text: authController.displyUserEmail.value,
               color: Get.isDarkMode ? Colors.white : Colors.black,
               underline: TextDecoration.none,
             ),
           ],
         )
       ],


     ),),

      ],
    );
  }
}
