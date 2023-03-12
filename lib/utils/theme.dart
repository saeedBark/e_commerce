import 'package:flutter/material.dart';

const Color mainColor = Colors.deepOrange;
const Color blackColor = Colors.black;
const Color pinkColor = Colors.pink;



class ThemeApp {
  static final light = ThemeData(
            primaryColor: mainColor,
    brightness: Brightness.light,
    backgroundColor: Colors.white,
  );
  static final dark = ThemeData(
    primaryColor: blackColor,
    brightness: Brightness.dark,
    backgroundColor: blackColor,
  );

}
