import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_store/models/product_model.dart';

class CartListController extends StateNotifier<List<Product>> {
  CartListController() : super([]);

  addToCart(Product product) {
    
    state = [...state, product];
  }

  removeFromCart(int id) {
    state = state.where((element) => element.id != id).toList();
  }
}
