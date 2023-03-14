import 'package:e_commerce/model/product_models.dart';
import 'package:e_commerce/utils/my_string%20.dart';
import 'package:http/http.dart' as http;

class ProductService {
static Future<List<ProductModels>> getProduct() async{
 var respons = await http.get(Uri.parse('$baseUrl/products'));

 if(respons.statusCode == 200){
 var jsonData = respons.body;
  return productModelsFromJson(jsonData);
 }else{
  return throw Exception('Failed to load product');
 }
 }

}