import 'package:e_commerce/utils/my_string%20.dart';
import 'package:http/http.dart' as http;

import '../model/category_models.dart';
import '../model/product_models.dart';

class CategoryService {
  static Future<List<String>> getCategory() async {
    var respons = await http.get(Uri.parse('$baseUrl/products/categories'));

    if (respons.statusCode == 200) {
      var jsonData = respons.body;
      return categoryModelFromJson(jsonData);
    } else {
      return throw Exception('Failed to load product');
    }
  }
}
class AllCategoryService {
  static Future<List<ProductModels>> getAllCategories(String categoryName) async {
    var respons = await http.get(Uri.parse('$baseUrl/products/category/$categoryName'));

    if (respons.statusCode == 200) {
      var jsonData = respons.body;
      return productModelsFromJson(jsonData);
    } else {
      return throw Exception('Failed to load product');
    }
  }
}