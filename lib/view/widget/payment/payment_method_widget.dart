// ignore_for_file: prefer_const_constructors

import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widget/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PaymentMethodWidget extends StatefulWidget {
  const PaymentMethodWidget({super.key});

  @override
  State<PaymentMethodWidget> createState() => _PaymentMethodWidgetState();
}

class _PaymentMethodWidgetState extends State<PaymentMethodWidget> {
  int radioPaymentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          //   buidRadioPayment(),
        ],
      ),
    );
  }

  Widget buidRadioPayment({
    required String image,
    required double scale,
    required String name,
    required Function onchange,
    required int value,
  }) {
    return Container(
      height: 50,
      width: double.infinity,
      color: Colors.grey.withOpacity(0.2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                image,
                scale: scale,
              ),
              SizedBox(
                width: 10,
              ),
              TextUtils(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                text: name,
                color: Colors.black,
                underline: TextDecoration.none,
              ),
            ],
          ),
          Radio(
            value: value,
            groupValue: radioPaymentIndex,
            fillColor: MaterialStateColor.resolveWith((states) => mainColor),
            onChanged: (int? value) {
              onchange(value);
            },
          ),
        ],
      ),
    );
  }
}
