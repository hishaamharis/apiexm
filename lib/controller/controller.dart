import 'package:apiexm/model/product_model.dart';
import 'package:apiexm/service/service.dart';
import 'package:get/get.dart';

class Controller extends GetxController{
  var isLoading = true.obs;
  var productList = [].obs;

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  void getProducts() async{
    try{
      isLoading(true);
      var prdcts = await Serviceprdct.fetchProducts();
      if(prdcts != null){
        productList.value = prdcts;
      }
    }
    catch(e){
      print(e);
    }
  }


}