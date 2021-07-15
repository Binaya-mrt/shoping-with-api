import 'package:flutter/material.dart';
import 'package:shop/controller/product_controller.dart';
import 'package:get/get.dart';
import 'package:shop/screens/product.dart';

class HomepageScreen extends StatelessWidget {
  final ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Icon(Icons.shop_outlined)],
        title: Text("Dokan"),
      ),
      body: FutureBuilder(builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (snapshot.error != null) {
            return Center(
              child: Text('An error occured'),
            );
          } else {
            return Obx(() => GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return ProductDetail(controller.productList[index]);
                  },
                  itemCount: controller.productList.length,
                ));
          }
        }
      }),
    );
  }
}
