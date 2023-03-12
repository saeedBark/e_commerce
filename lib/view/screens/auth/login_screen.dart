import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:e_commerce/utils/my_string%20.dart';
import 'package:e_commerce/utils/routes/routes.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widget/auth/auth_button.dart';
import 'package:e_commerce/view/widget/auth/auth_text_from_field.dart';
import 'package:e_commerce/view/widget/auth/container_under.dart';
import 'package:e_commerce/view/widget/check_widget.dart';
import 'package:e_commerce/view/widget/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  GlobalKey formKey = GlobalKey<FormState>();

  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? blackColor:Colors.white ,
          elevation: 0,
        ),
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
                                text: 'LOG',
                                color: Colors.deepOrange,
                                underline: TextDecoration.none),
                            const SizedBox(
                              width: 5,
                            ),
                            TextUtils(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                text: 'IN',
                                color:
                                    Get.isDarkMode ? blackColor : Colors.white,
                                underline: TextDecoration.none)
                          ],
                        ),
                        SizedBox(
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
                        Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.forgetScreen);
                            },
                            child: TextUtils(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                text: 'Forget Password? ',
                                color: Get.isDarkMode
                                    ? Colors.black
                                    : Colors.white,
                                underline: TextDecoration.none),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthButton(
                            onpress: () {
                           //   if (formKey.currentState!.validate()) {
                                controller.logInUsingFirebase(
                                    email: emailController.text.trim(),
                                    password: passwordController.text);
                          //    }
                            },
                            text: 'LOG IN',
                          );
                        }),
                        const SizedBox(
                          height: 10,
                        ),
                        TextUtils(
                            fontSize: 22,
                            fontWeight: FontWeight.normal,
                            text: 'OR',
                            color: Get.isDarkMode ? Colors.black : Colors.white,
                            underline: TextDecoration.none),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/facebook1.png',
                              height: 50,
                              width: 50,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                           GetBuilder<AuthController>(builder: (_){
                             return  InkWell(
                               onTap: (){
                                 controller.googleSignUpApp();
                               },
                               child: Image.asset(
                                 'assets/images/google1.png',
                                 height: 44,
                                 width: 44,
                               ),
                             );
                           })
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                ContainerUnder(
                    text: "Don't have an Account?",
                    textType: 'Sign up',
                    onPress: () {
                      Get.offNamed(Routes.signupScreen);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
