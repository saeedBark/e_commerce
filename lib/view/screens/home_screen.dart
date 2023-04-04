import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widget/home/card_item.dart';
import 'package:e_commerce/view/widget/home/search_form_text.dart';
import 'package:e_commerce/view/widget/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 170,
            decoration: BoxDecoration(
              color: Get.isDarkMode ? blackColor : mainColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                   const TextUtils(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    text: 'Find your',
                    color: Colors.white,
                    underline: TextDecoration.none,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const TextUtils(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    text: 'INSPIRATION',
                    color: Colors.white,
                    underline: TextDecoration.none,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SearchFormText(),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left:20.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: TextUtils(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                text: 'Products',
                color: Get.isDarkMode ? Colors.white : Colors.black,
                underline: TextDecoration.none,
              ),
            ),
          ),
          const SizedBox(height: 10,),
          CardItem(),
        ],
      ),
    ));
  }
}
