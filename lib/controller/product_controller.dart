import 'package:get/get.dart';
import 'package:shop/model/product_model.dart';
import 'package:shop/services/remote_api.dart';

class ProductController extends GetxController {
  var productList = <Product>[].obs;

  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
    var products = await RemoteService.fetchProduct();
    if (products != null) {
      productList.value = products;
    }
  }
}
