import 'package:apiexm/screens/productTile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../controller/controller.dart';



class HomePage extends StatelessWidget {
  final Controller productController = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.yellow[200],
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Products',
                    style: TextStyle(
                        fontFamily: 'avenir',
                        fontSize: 32,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (productController.isLoading.value)
                return Center(child: CircularProgressIndicator());
              else
                return StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  itemCount: productController.productList.length,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  itemBuilder: (context, index) {
                    return ProductTile(productController.productList[index]);
                  },
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                );
            }),
          )
        ],
      ),
    );
  }
}
