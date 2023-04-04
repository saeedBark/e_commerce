import 'package:e_commerce/model/product_models.dart';
import 'package:get/get.dart';

import '../../services/category_service.dart';

class CategoryController extends GetxController {
  var categoryNameList = <String>[].obs;
  var isCategoryLoading = false.obs;
  var categoryList = <ProductModels>[].obs;
  var isAllCategoryLoading = false.obs;

  List<String> imageCategory = [
    'https://fakestoreapi.com/img/61mtL65D4cL._AC_SX679_.jpg',
    'https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg',
    'https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg',
    'https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_.jpg',
  ];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCategorys();
  }

  void getCategorys() async {
    var categoryName = await CategoryService.getCategory();

    try {
      isCategoryLoading(true);
      if (categoryName.isNotEmpty) {
        categoryNameList.addAll(categoryName);
      }
    } finally {
      isCategoryLoading(false);
    }
  }

  getAllCategorys(String nameCategory) async {
    isAllCategoryLoading(true);
    categoryList.value =
        await AllCategoryService.getAllCategories(nameCategory);

    isAllCategoryLoading(false);
  }

  getCategoryIndex(int index) async {
    var categoryAllName = await getAllCategorys(categoryNameList[index]);
    if (categoryAllName != null) {
      categoryList.value = categoryAllName;
    }
  }
}
