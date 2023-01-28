import 'package:e_commerce/logic/bindings/aut_biniding.dart';
import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:e_commerce/utils/my_string%20.dart';
import 'package:e_commerce/utils/routes/routes.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/screens/auth/login_screen.dart';
import 'package:e_commerce/view/screens/auth/login_screen.dart';
import 'package:e_commerce/view/screens/auth/login_screen.dart';
import 'package:e_commerce/view/screens/auth/login_screen.dart';
import 'package:e_commerce/view/screens/auth/login_screen.dart';
import 'package:e_commerce/view/screens/auth/login_screen.dart';
import 'package:e_commerce/view/widget/auth/auth_button.dart';
import 'package:e_commerce/view/widget/auth/auth_text_from_field.dart';
import 'package:e_commerce/view/widget/auth/container_under.dart';
import 'package:e_commerce/view/widget/check_widget.dart';
import 'package:e_commerce/view/widget/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final controller = Get.find<AuthController>();

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.white : blackColor,
          elevation: 0,
        ),
        backgroundColor: Get.isDarkMode ? Colors.white : blackColor,
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 1.3,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, top: 40),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const TextUtils(
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                text: 'SIGN',
                                color: Colors.deepOrange,
                                underline: TextDecoration.none),
                            const SizedBox(
                              width: 5,
                            ),
                            TextUtils(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                text: 'UP',
                                color:
                                    Get.isDarkMode ? blackColor : Colors.white,
                                underline: TextDecoration.none)
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        authTextFromField(
                          controller: nameController,
                          obscureText: false,
                          cursorColor: Colors.black,
                          fillColor: Colors.grey.shade200,
                          prefixIcon: Get.isDarkMode
                              ? Image.asset(
                                  'assets/images/user4.png',
                                  height: 10,
                                  width: 10,
                                  color: Colors.blue,
                                )
                              : Icon(
                                  Icons.person,
                                  color: Colors.deepOrange,
                                  size: 30,
                                ),
                          suffixIcon: Text(""),
                          text: 'User Name',
                          type: TextInputType.name,
                          validator: (Value) {
                            if (Value.toString().length <= 2 ||
                                !RegExp(validationName).hasMatch(Value)) {
                              return 'Enter valid name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
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
                          height: 20,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return authTextFromField(
                            controller: passwordController,
                            obscureText: controller.isVisibilty ? false : true,
                            cursorColor: Colors.black,
                            fillColor: Colors.grey.shade200,
                            prefixIcon: Get.isDarkMode
                                ? Image.asset(
                                    'assets/images/passwo.png',
                                    height: 7,
                                    width: 7,
                                    color: Colors.blue,
                                  )
                                : Icon(
                                    Icons.password,
                                    color: Colors.deepOrange,
                                    size: 30,
                                  ),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  controller.visibilty();
                                },
                                icon: controller.isVisibilty
                                    ? Icon(
                                        Icons.visibility_off,
                                        color: Colors.black,
                                      )
                                    : Icon(
                                        Icons.visibility,
                                        color: Colors.black,
                                      )),
                            text: 'Password',
                            type: TextInputType.visiblePassword,
                            validator: (Value) {
                              if (Value.toString().length <= 8) {
                                return 'Password should be longer or equal to 8 characters';
                              }
                              return null;
                            },
                          );
                        }),

                        SizedBox(
                          height: 30,
                        ),
                        CheckWidget(),
                        SizedBox(
                          height: 50,
                        ),
                        AuthButton(
                          onpress: () {},
                          text: 'SIGN UP',
                        ),

                        // Expanded(
                        //   child:
                        // ),
                      ],
                    ),
                  ),
                ),
                ContainerUnder(
                    text: 'Already have an Account? ',
                    textType: 'Log in',
                    onPress: () {
                      Get.offNamed(Routes.loginScreen);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
