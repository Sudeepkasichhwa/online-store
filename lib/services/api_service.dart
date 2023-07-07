import 'dart:convert';
import 'package:http/http.dart';
import 'package:online_store/models/product_model.dart';

class ApiServices {
  Future<List<Product>> getData() async {
    Uri uri = Uri.parse("https://fakestoreapi.com/products");
    // var url = Uri.https('fakestoreapi.com', '/products');

    Response response = await get(uri);

    if (response.statusCode == 200) {
      List<Product> products = [];
      final List datas = jsonDecode(response.body);
      datas.forEach((e) {
        products.add(Product.fromJson(e));
      });
      return products;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

// final productListProvider = Provider<ApiServices>((ref)=>ApiServices());
