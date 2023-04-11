import 'package:e_commerce/utils/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  bool isVisibilty = false;
  bool ischeckBox = false;
  var displayUserName = ''.obs;
  var googleSinup = GoogleSignIn();
  var displayUserPhoto = ''.obs;
  var displyUserEmail = ''.obs;
  final GetStorage boxAuth = GetStorage();
  var isSignIn = false;
  FirebaseAuth auth = FirebaseAuth.instance;

@override
User ? get userProfile => auth.currentUser;

  void onInit() {
    // TODO: implement onInit
displayUserName.value = (userProfile != null ? userProfile!.displayName : "")!;
    super.onInit();
  }

  void visibilty() {
    isVisibilty = !isVisibilty;
    update();
  }

  void checkBox() {
    ischeckBox = !ischeckBox;
    update();
  }

  void signUpUsingFirebase({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password)
          .then((value) {
        displayUserName.value = name;
        auth.currentUser!.updateDisplayName(name);

      }
      );
             update();
             Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll('-', ' ').capitalize!;
      String message = '';
      if (error.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (error.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void logInUsingFirebase({
    required String email,
    required String password,
  }) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: email, password: password)
          .then((value) {
        auth.currentUser!.updateDisplayName(displayUserName.value);
        isSignIn = true;
        boxAuth.write('saveLogin', isSignIn);

      }
      );
      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll('-', ' ').capitalize!;
      String message = '';
      if (error.code == 'user-not-found') {
        message = 'Account does not exist for that $email.. Create you account by signing up ...';
      } else if (error.code == 'wrong password') {
        message = 'Invalid Password.. Please try again!.';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }
  void googleSignUpApp() async{
    try{
      final GoogleSignInAccount? googleUser = await googleSinup.signIn();
      displayUserName.value = googleUser!.displayName!;
      displayUserPhoto.value = googleUser.photoUrl!;
      isSignIn = true;
      boxAuth.write('saveLogin', isSignIn);
      update();
      Get.offNamed(Routes.mainScreen);
    }catch(error){
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }

  }

  void facebookSignUpApp() {}


  void restPassword({
   required  String email,
  }) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      update();
      Get.back();

    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll('-', ' ').capitalize!;
      String message = '';
      if (error.code == 'user-not-found') {
        message =
        'Account does not exist for that $email.. Create you account by signing up ...';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }
  void signOutFromApp() async{
    try{
    await  auth.signOut();
  //  await googleSinup.signOut();
  //  await FacebookAuth.
      displayUserName.value = '';
      displayUserPhoto.value= '';
      displyUserEmail.value = '';
      update();
      Get.offNamed(Routes.welcomeScreen);

    isSignIn = false;
    boxAuth.remove('saveLogin');

    }catch(error){
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }
}
