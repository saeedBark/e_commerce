import 'package:e_commerce/utils/my_string%20.dart';
import 'package:http/http.dart' as http;

class ProductService {
 void getProduct(){
   http.get(Uri.parse('$baseUrl/products'));
 }
}