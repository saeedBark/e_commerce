import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widget/cart/cart_product_card.dart';
import 'package:e_commerce/view/widget/cart/cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            title: Text('Cart Item'),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Get.isDarkMode ? blackColor : mainColor,
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.backspace)),
            ],
          ),
          body: SingleChildScrollView(
            child: SizedBox(
              height: 600,
              child: ListView.separated(
                itemBuilder: (context,index) => CartProductCard(),
                separatorBuilder: (context,index) => SizedBox(height: 20,),
                itemCount: 1,
              ),
            ),
          )),
    );
  }
}
