import 'package:e_commerce/logic/controller/cart_controller.dart';
import 'package:e_commerce/model/product_models.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widget/text_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCart extends StatelessWidget {
   AddCart({Key? key, required this.price, required this.productModels})
      : super(key: key);
  final double price;
  final ProductModels productModels;
  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(25),
        child: Row(
          children: [
            Column(
              children: [
                const TextUtils(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  text: 'Price',
                  color: Colors.grey,
                  underline: TextDecoration.none,
                ),
                Text(
                  price.toString(),
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 20,
                  ),
                )
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: SizedBox(
                height: 60,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      backgroundColor: Get.isDarkMode ? pinkColor : mainColor,
                      elevation: 0,
                    ),
                    onPressed: () {
                      controller.addProductToCart(productModels);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Add to Cart',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.shopping_cart_outlined),
                      ],
                    )),
              ),
            )
          ],
        ));
  }
}
