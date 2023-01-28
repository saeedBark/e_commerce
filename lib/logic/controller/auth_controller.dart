import 'package:get/get.dart';

class AuthController extends GetxController {
  bool isVisibilty = false;
  bool ischeckBox = false;

  void visibilty() {
    isVisibilty = !isVisibilty;
    update();
  }

  void checkBox() {
    ischeckBox = !ischeckBox;
    update();
  }
}
