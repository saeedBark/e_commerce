import 'package:e_commerce/logic/controller/main_controller.dart';
import 'package:get/get.dart';

class MainBainding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
  }
}
