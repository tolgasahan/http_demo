import 'package:http/http.dart' as http;

class ProductApi{
  static Future getProducts() async {
      http.Response response =  await http.get(Uri.parse(
          'http://10.0.2.2:3000/products'
      ));
      return response;
  }


  static Future getProductsByCategoryId(int? categoryId) async {
    http.Response response =  await http.get(Uri.parse(
        'http://10.0.2.2:3000/products?categoryId=$categoryId'
    ));
    return response;
  }
}