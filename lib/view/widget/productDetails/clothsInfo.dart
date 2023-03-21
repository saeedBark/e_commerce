import 'package:e_commerce/logic/controller/product_controller.dart';
import 'package:e_commerce/view/widget/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


import 'package:get/get.dart';

class ClothesInfo extends StatelessWidget {
  final String title;
  final int producId;
  final double rate;
  ClothesInfo(
      {Key? key,
      required this.title,
      required this.producId,
      required this.rate})
      : super(key: key);
  final controller = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Obx(
                () => Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Get.isDarkMode
                          ? Colors.white
                          : Colors.grey.withOpacity(0.4),
                      shape: BoxShape.circle),
                  child: InkWell(
                    onTap: () {
                      controller.manageFavorites(producId);
                    },
                    child: controller.isFavorites(producId)
                        ? const Icon(
                            Icons.favorite,
                            size: 20,
                            color: Colors.red,
                          )
                        : const Icon(
                            Icons.favorite_outline,
                            size: 20,
                          ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              TextUtils(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                text: '$rate',
                color: Get.isDarkMode ? Colors.white : Colors.black,
                underline: TextDecoration.none,
              ),
              SizedBox(width: 8,),
              // RatingBar(
              //   rating: rate,
              //   icon: Icon(Icons.star,size: 20,color: Colors.grey,),
              //   spacing: 1,
              //   starCount: 5,
              //   isIndicator: false,
              //   size: 20,
              //   allowHalfRating: true,
              //   onRatingCallback: (value,isIndictor){
              //     isIndictor.value = true;
              //   },
              //   color: Colors.orangeAccent,
              // ),
              RatingBarIndicator(
                rating: rate,
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 20.0,
                direction: Axis.horizontal,
              ),
            ],
          )
        ],
      ),
    );
  }
}
