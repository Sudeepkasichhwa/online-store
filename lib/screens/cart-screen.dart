import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_store/widgets/product_card.dart';

import '../providers/product_details_provider.dart';

class CartScreen extends ConsumerStatefulWidget {
  CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {

  @override
  Widget build(BuildContext context) {
    final cartList = ref.watch(cartsProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.blueGrey,
        title: Text(
          "Carts",
          style: TextStyle(color: Colors.white),
        ),),
        body: SingleChildScrollView(
          child: cartList.isEmpty?Container(child: Center(child: Text("Cart is empty !!")))
          :GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: cartList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 5.0,
              mainAxisExtent: 260.0,
            ),
            itemBuilder: (context, index) {
              return Container(
                child: ProductCard(cartList[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}
