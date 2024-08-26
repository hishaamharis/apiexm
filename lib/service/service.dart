import '../model/product_model.dart';
import 'package:http/http.dart'as http;

class Serviceprdct {
  static Future<List<Sample>> fetchProducts() async{
    var response = await http.get(Uri.parse("https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"));
    if(response.statusCode == 200){
      var data = response.body;
      return sampleFromJson(data);
    }else{
      throw Exception();
    }
  }
}