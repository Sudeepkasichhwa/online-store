import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_store/models/product_model.dart';
import 'package:online_store/services/api_service.dart';

class ProductListController extends StateNotifier<List<Product>> {
  ProductListController() : super([]) {
    fetchData();
  }

  ApiServices apiServices = ApiServices();

  fetchData() async {
    try {
      final data = await apiServices.getData();
      state = [...data];
    } catch (e) {}
  }

  void searchProduct({required Product product}) {
    state = [
      ...state.where(
          (e) => e.title.toLowerCase().contains(product.title.toLowerCase()))
    ];
  }
}
