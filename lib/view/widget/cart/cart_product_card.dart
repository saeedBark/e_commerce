import 'package:e_commerce/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({Key? key}) : super(key: key);

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
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1678971185029-7eec9e5433e0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyMHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
                  ),
                  fit: BoxFit.cover,
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
                  'flutter is very easy with me please do that ok ',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                    color: Get.isDarkMode ? Colors.white : blackColor,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  '\$ 250.99',
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
                        onPressed: () {},
                        icon: Icon(
                          Icons.remove_circle,
                          color: Get.isDarkMode ? Colors.white : blackColor,
                        ),),
                    Text(
                      '1',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Get.isDarkMode ? Colors.white : blackColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_circle,
                        color: Get.isDarkMode ? Colors.white : blackColor,
                      ),),
                  ],
                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.delete,color:Get.isDarkMode? Colors.grey : Colors.red,))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
