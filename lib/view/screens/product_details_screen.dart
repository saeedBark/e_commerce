import 'package:e_commerce/model/product_models.dart';
import 'package:e_commerce/view/widget/productDetails/image_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductModels productModels;
   ProductDetailsScreen({Key? key,required this.productModels}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              ImageSlider(
                imageUrl: productModels.image,

              ),









              // ClothesInfo(),
              // SizeList(),
              // AddCart(),
            ],
          ),
        ),
      ),
    );
  }
}
