import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widget/text_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() onpress;
  const AuthButton({super.key, required this.text, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpress,
      style: ElevatedButton.styleFrom(
        backgroundColor: Get.isDarkMode ? mainColor : Colors.deepOrange,
        minimumSize: const Size(350, 50),
      ),
      child: TextUtils(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          text: text,
          color: Colors.white,
          underline: TextDecoration.none),
    );
  }
}
