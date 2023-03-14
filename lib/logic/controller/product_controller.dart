import 'package:e_commerce/model/product_models.dart';
import 'package:e_commerce/services/product_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var productList = <ProductModels>[].obs;
  var isLoading = true.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
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
}
