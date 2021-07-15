import 'package:http/http.dart' as http;
import 'package:shop/model/product_model.dart';

class RemoteService {
  var url = Uri.parse(
      'http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline');
  static var client = http.Client();
  static Future<List<Product>?> fetchProduct() async {
    var response = await client.get(
      Uri.parse(
          'http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'),
    );

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    } else
      return null;
  }
}
