import 'package:e_commerce/view/widget/category/category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controller/category_controller.dart';
import '../../../utils/theme.dart';

class CategoryWidget extends StatelessWidget {
   CategoryWidget({Key? key}) : super(key: key);
 final controller = Get.find<CategoryController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if(controller.isCategoryLoading.value){
        return Center(
          child: CircularProgressIndicator(
            color: Get.isDarkMode ? pinkColor : mainColor,
          ),
        );
      } else {
      return  Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  controller.getCategoryIndex(index);
                  Get.to(() => CategoryItem());
                },
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black,
                    image:  DecorationImage(
                      image: NetworkImage(
                          controller.imageCategory[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child:  Padding(
                    padding: EdgeInsets.only(left: 20.0, bottom: 10),
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          controller.categoryNameList[index],
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              backgroundColor: Colors.black38),
                        )),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: 15,
            ),
            itemCount: controller.categoryNameList.length,
          ),
        );
      }
    });
  }
}
