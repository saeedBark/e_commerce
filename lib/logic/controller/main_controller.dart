import 'package:e_commerce/view/screens/category_screen.dart';
import 'package:e_commerce/view/screens/favorite_screen.dart';
import 'package:e_commerce/view/screens/home_screen.dart';
import 'package:e_commerce/view/screens/setting_screen.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;
  final tabs = const [
    HomeScreen(),
    CategoryScreen(),
    FavoritesScreen(),
    SettingScreen(),
  ].obs;
  final title = [
    'Saeed Shop',
    'Categories',
    'Favorites',
    'Setting',
  ].obs;
}
