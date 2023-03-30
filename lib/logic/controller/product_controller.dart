import 'package:e_commerce/model/product_models.dart';
import 'package:e_commerce/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductController extends GetxController {
  var productList = <ProductModels>[].obs;
  var favoritesList = <ProductModels>[].obs;
  var isLoading = true.obs;
  var storage = GetStorage();
//// start search ////
  var searchList = <ProductModels>[].obs;
  TextEditingController searchController = TextEditingController();
  //////end search////
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    List? storedShop = storage.read('isFavoritesList');
    if (storedShop != null) {
      favoritesList =
          storedShop.map((e) => ProductModels.fromJson(e)).toList().obs;
    }
    getProducts();
  }

  void getProducts() async {
    var product = await ProductService.getProduct();
    try {
      isLoading(true);
      if (product.isNotEmpty) {
        productList.addAll(product);
      }
    } finally {
      isLoading(false);
    }
  }

  void manageFavorites(int productId) async {
    var existIndex =
        favoritesList.indexWhere((element) => element.id == productId);
    print('============');
    print(existIndex);
    print('============');
    if (existIndex >= 0) {
      favoritesList.removeAt(existIndex);
      await storage.remove('isFavoritesList');
    } else {
      favoritesList
          .add(productList.firstWhere((element) => element.id == productId));

      await storage.write('isFavoritesList', favoritesList);
    }
  }

  bool isFavorites(int productId) {
    return favoritesList.any((element) => element.id == productId);
  }

  ///////// Search Bar Logic
  void addSearchToList(String searchName) {
    searchName = searchName.toLowerCase();
    searchList.value = productList.where((search) {

      var searchTitle = search.title.toLowerCase();
      var searchPrice= search.price.toString().toLowerCase();

      return searchTitle.contains(searchName) ||
          searchPrice.toString().contains(searchName);
    }).toList();

    update();
  }

  void clearSearch() {
    searchController.clear();
    addSearchToList("");
  }
}
