import 'package:e_commerce/logic/controller/cart_controller.dart';
import 'package:e_commerce/utils/routes/routes.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widget/text_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartTotal extends StatelessWidget {
  final controller = Get.find<CartController>();
   CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() =>  Container(
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextUtils(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                text: 'Total',
                color: Colors.grey,
                underline: TextDecoration.none,
              ),
              Text(
                controller.total.toString(),
                style: TextStyle(
                    fontSize: 20,
                    color: Get.isDarkMode ? Colors.white : blackColor,
                    height: 1.5,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Get.isDarkMode ? pinkColor : mainColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    )
                ),
                onPressed: () {
                  Get.toNamed(Routes.paymentScreen);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Check Out', style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                    ),
                    SizedBox(width: 20,),
                    Icon(Icons.shopping_cart)
                  ],
                ),

              ),
            ),
          )
        ],
      ),
    ),);
  }
}
