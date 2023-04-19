import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:e_commerce/view/widget/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class CheckWidget extends StatelessWidget {
  CheckWidget({super.key});
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_) {
      return Row(
        children: [
          InkWell(
            onTap: () {
              controller.checkBox();
            },
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: controller.ischeckBox
                  ? Get.isDarkMode
                      ? Image.asset(
                          'assets/images/check.png',
                          fit: BoxFit.cover,
                          color: Colors.blue,
                        )
                      : const Icon(
                          Icons.done,
                          color: Colors.deepOrange,
                        )
                  : Container(),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Row(
            children: [
              TextUtils(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  text: 'I accept ',
                  color: Get.isDarkMode ? Colors.white : Colors.black ,
                  underline: TextDecoration.none),
              TextUtils(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  text: 'terms & conditions ',
                  color: Get.isDarkMode ? Colors.white : Colors.black ,
                  underline: TextDecoration.underline)
            ],
          )
        ],
      );
    });
  }
}
