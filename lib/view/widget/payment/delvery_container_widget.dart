import 'package:e_commerce/view/widget/text_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeliveryContainerWidget extends StatefulWidget {
  const DeliveryContainerWidget({Key? key}) : super(key: key);

  @override
  State<DeliveryContainerWidget> createState() =>
      _DeliveryContainerWidgetState();
}

class _DeliveryContainerWidgetState extends State<DeliveryContainerWidget> {
  int radioContainerIndex = 1;
  bool changeColors = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRadioContainer(
          color: changeColors ? Colors.white : Colors.grey.shade300,
          value: 1,
          onChanged: (int value) {
            setState(() {
              radioContainerIndex = value;
              changeColors = !changeColors;
            });
          },
          name: 'Saeed Bark ',
          title: 'Saeed Shop',
          phone: '42-721-553',
          adress: 'Mauritania, nouachott ',
        ),
        SizedBox(
          height: 10,
        ),
        buildRadioContainer(
          color: changeColors ? Colors.grey.shade300 : Colors.white,
          value: 2,
          onChanged: (int value) {
            setState(() {
              radioContainerIndex = value;
              changeColors = !changeColors;
            });
          },
          name: 'Saeed Store ',
          title: 'Saeed Shop',
          phone: '20-611-327',
          adress: 'Mauritania, noua ',
        ),
      ],
    );
  }

  Widget buildRadioContainer({
    required Color color,
    required int value,
    required Function onChanged,
    required String name,
    required String title,
    required String phone,
    required String adress,
  }) {
    return Container(
      height: 130,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5,
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Radio(
            value: value,
            groupValue: radioContainerIndex,
            fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
            onChanged: (int? value) {
              onChanged(value);
            },
          ),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              children: [
                TextUtils(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  text: title,
                  color: Colors.black,
                  underline: TextDecoration.none,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextUtils(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  text: name,
                  color: Colors.black,
                  underline: TextDecoration.none,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextUtils(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  text: phone,
                  color: Colors.black,
                  underline: TextDecoration.none,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextUtils(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  text: adress,
                  color: Colors.black,
                  underline: TextDecoration.none,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
