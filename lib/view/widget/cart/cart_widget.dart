import 'package:e_commerce/utils/routes/routes.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyCard extends StatelessWidget {
  const EmptyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart,
            color: Get.isDarkMode ? Colors.white : blackColor,
            size: 150,
          ),
          SizedBox(
            height: 30,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Your cart is ',
                  style: TextStyle(
                    fontSize: 30,
                    color: Get.isDarkMode ? Colors.white : blackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'Empty ',
                  style: TextStyle(
                    fontSize: 30,
                    color: Get.isDarkMode ? pinkColor : mainColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Text(
            'Add item to get Started',
            style: TextStyle(
                fontSize: 15,
                color: Get.isDarkMode ? Colors.white : blackColor,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 40,
          ),
          SizedBox(
            height: 45,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
                backgroundColor: Get.isDarkMode ? pinkColor : mainColor,
                elevation: 0,
              ),
              onPressed: () {
                Get.toNamed(Routes.mainScreen);
              },
              child: Text('Go to Home',style: TextStyle(fontSize: 20,),),
            ),
          ),
        ],
      ),
    );
  }
}
