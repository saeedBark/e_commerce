import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:e_commerce/utils/my_string%20.dart';
import 'package:e_commerce/view/widget/auth/auth_button.dart';
import 'package:e_commerce/view/widget/auth/auth_text_from_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ForgetScreen extends StatelessWidget {
  ForgetScreen({super.key});
  final formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
          title: Text(
            'Forget Password',
            style: TextStyle(
              color: Get.isDarkMode ? Colors.white : Colors.deepOrange,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Get.isDarkMode ? Colors.black : Colors.white,
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(Icons.close_rounded),
                      color: Colors.white,
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'If you want to recover your account , then please provide your email ID below..',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    'assets/images/forget1.png',
                    width: 300,
                    // fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  authTextFromField(
                    controller: emailController,
                    obscureText: false,
                    cursorColor: Colors.black,
                    fillColor: Colors.grey.shade200,
                    prefixIcon: Get.isDarkMode
                        ? Image.asset(
                            'assets/images/email1.png',
                            height: 10,
                            width: 10,
                            color: Colors.blue,
                          )
                        : Icon(
                            Icons.email,
                            color: Colors.deepOrange,
                            size: 30,
                          ),
                    suffixIcon: Text(""),
                    text: 'Email',
                    type: TextInputType.emailAddress,
                    validator: (Value) {
                      if (!RegExp(validationEmail).hasMatch(Value)) {
                        return 'Enter valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                 GetBuilder<AuthController>(
                     builder: (_){
                   return  AuthButton(
                     onpress: () {
                   //    if(formkey.currentState!.validate()){
                       String email = emailController.text.trim();
                         controller.restPassword( email: email,);
                   //    }
                     },
                     text: 'SEND',
                   );
                 })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
