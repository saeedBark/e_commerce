import 'package:e_commerce/logic/controller/theme_controller.dart';
import 'package:e_commerce/view/widget/text_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controller/setting_controller.dart';
import '../../../utils/theme.dart';

class DarkModeWidget extends StatelessWidget {
   DarkModeWidget({Key? key}) : super(key: key);

   final controller = Get.find<SettingController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildIconWidget(),
          Switch(
              activeTrackColor:Get.isDarkMode ? pinkColor : mainColor,
              activeColor: Get.isDarkMode ? pinkColor : mainColor ,
              value: controller.switchValue.value, onChanged: (value){
            ThemeController().changeTheme();
            controller.switchValue.value = value;
          }),

        ],
      );
    });
  }

  Widget buildIconWidget() {
    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: darkSettings,
            ),
            child: const Icon(
              Icons.dark_mode,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
           TextUtils(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            text: 'Dark Mode',
            color: Get.isDarkMode ? Colors.white : Colors.black,
            underline: TextDecoration.none,
          ),
        ],
      ),
    );
  }
}
