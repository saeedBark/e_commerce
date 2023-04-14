import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widget/payment/delvery_container_widget.dart';
import 'package:e_commerce/view/widget/payment/payment_method_widget.dart';
import 'package:e_commerce/view/widget/text_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: const Text('Payment'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Get.isDarkMode ? blackColor : mainColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                text: 'Shipping to ',
                color: Get.isDarkMode ? Colors.white : Colors.black,
                underline: TextDecoration.none,
              ),
              const SizedBox(
                height: 20,
              ),
              const DeliveryContainerWidget(),
              const SizedBox(
                height: 20,
              ),
              TextUtils(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                text: 'Payment method ',
                color: Get.isDarkMode ? Colors.white : Colors.black,
                underline: TextDecoration.none,
              ),
              const SizedBox(
                height: 20,
              ),
              // PaymentMethodWidget(),
              const SizedBox(
                height: 30,
              ),
              PaymentMethodWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
