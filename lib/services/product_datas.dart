import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ProductDatas {
  late List productsDatas;

  ProductDatas() {
    getData();
  }

  void getData() async {
    var url = Uri.https('fakestoreapi.com', '/products');
    Response response = await get(url);
    productsDatas = jsonDecode(response.body);
    print(" data called");
  }
}
