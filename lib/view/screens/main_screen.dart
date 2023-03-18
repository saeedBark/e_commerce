import 'package:e_commerce/logic/controller/main_controller.dart';
import 'package:e_commerce/utils/routes/routes.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final controller = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () {
          return Scaffold(
            backgroundColor: context.theme.backgroundColor,
            appBar: AppBar(
              elevation: 0,
              leading: Container(),
              actions: [
                IconButton(
                  onPressed: () {
                     Get.toNamed(Routes.cartScreen);
                  },
                  icon: Icon(Icons.shop),
                ),
              ],
              title: Text(controller.title[controller.currentIndex.value]),
              centerTitle: true,
              backgroundColor: Get.isDarkMode ? blackColor : mainColor,
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.currentIndex.value,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Get.isDarkMode ? blackColor : Colors.white,
              items: [
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.home,
                    color: Get.isDarkMode ? pinkColor:mainColor ,
                  ),
                  icon: Icon(Icons.home,
                      color:  Get.isDarkMode ? Colors.white : blackColor),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.category,
                    color: Get.isDarkMode ? pinkColor:mainColor ,
                  ),
                  icon: Icon(Icons.category,
                      color:  Get.isDarkMode ? Colors.white : blackColor),
                  label: 'Category',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.favorite,
                    color:Get.isDarkMode ? pinkColor:mainColor ,
                  ),
                  icon: Icon(Icons.favorite,
                      color: Get.isDarkMode ? Colors.white : blackColor),
                  label: 'Favorite',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.settings,
                    color: Get.isDarkMode ? pinkColor : mainColor ,
                  ),
                  icon: Icon(Icons.settings,
                      color: Get.isDarkMode ? Colors.white : blackColor),
                  label: 'Setting',
                ),
              ],
              onTap: (index) {
                controller.currentIndex.value = index;
              },
            ),
            body: IndexedStack(
              index: controller.currentIndex.value,
              children: controller.tabs.value,
            ),
          );
        },
      ),
    );
  }
}
