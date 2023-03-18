import 'package:e_commerce/logic/controller/cart_controller.dart';
import 'package:e_commerce/model/product_models.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartProductCard extends StatelessWidget {
  final ProductModels productModels;
  final int index;
  final int quantity;
   CartProductCard({Key? key, required this.productModels,required this.index, required this.quantity}) : super(key: key);

   final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Get.isDarkMode
              ? pinkColor.withOpacity(0.5)
              : mainColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            height: 140,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                image:  DecorationImage(
                  image: NetworkImage(
                    productModels.image,
                  ),
                  //fit: BoxFit.cover,
                  //
                )),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModels.title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                    color: Get.isDarkMode ? Colors.white : blackColor,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  controller.productSubTotal[index].toStringAsFixed(2).toString(),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : blackColor,
                  ),
                )
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          controller.removeProductFromCart(productModels);
                        },
                        icon: Icon(
                          Icons.remove_circle,
                          color: Get.isDarkMode ? Colors.white : blackColor,
                        ),),
                    Text(
                      quantity.toString(),
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Get.isDarkMode ? Colors.white : blackColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.addProductToCart(productModels);
                      },
                      icon: Icon(
                        Icons.add_circle,
                        color: Get.isDarkMode ? Colors.white : blackColor,
                      ),),
                  ],
                ),
                IconButton(onPressed: (){
                  controller.removeOneProduct(productModels);
                }, icon: Icon(Icons.delete,color:Get.isDarkMode? Colors.grey : Colors.red,))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
