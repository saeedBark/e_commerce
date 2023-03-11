import 'package:e_commerce/logic/controller/main_controller.dart';
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
            appBar: AppBar(
              elevation: 0,
              leading: Container(),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.shop),
                ),
              ],
              title: Text('Saeed Shop'),
              centerTitle: true,
              backgroundColor: Get.isDarkMode ? mainColor : blackColor,
            ),
            backgroundColor: Get.isDarkMode ? Colors.white : blackColor,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.currentIndex.value,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Get.isDarkMode ? Colors.white : blackColor,
              items: [
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.home,
                    color: Get.isDarkMode ? mainColor : Colors.pink,
                  ),
                  icon: Icon(Icons.home,
                      color: Get.isDarkMode ? blackColor : Colors.white),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.category,
                    color: Get.isDarkMode ? mainColor : Colors.pink,
                  ),
                  icon: Icon(Icons.category,
                      color: Get.isDarkMode ? blackColor : Colors.white),
                  label: 'Category',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.favorite,
                    color: Get.isDarkMode ? mainColor : Colors.pink,
                  ),
                  icon: Icon(Icons.favorite,
                      color: Get.isDarkMode ? blackColor : Colors.white),
                  label: 'Favorite',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.settings,
                    color: Get.isDarkMode ? mainColor : Colors.pink,
                  ),
                  icon: Icon(Icons.settings,
                      color: Get.isDarkMode ? blackColor : Colors.white),
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
