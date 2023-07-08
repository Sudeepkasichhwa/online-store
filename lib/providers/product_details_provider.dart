import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_store/controllers/cart_list_controller.dart';
import 'package:online_store/controllers/product_list_controller.dart';
import 'package:online_store/models/product_model.dart';

// final productDetailsProvider = FutureProvider(
//   (ref) async => ref.watch(productListProvider).getData(),
// );

final productsProvider = StateNotifierProvider<ProductListController,List<Product>>((ref) {
  return ProductListController();
});

final cartsProvider = StateNotifierProvider<CartListController,List<Product>>((ref) {
  return CartListController();
});