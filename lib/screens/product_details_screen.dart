import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_store/models/product_model.dart';
import 'package:online_store/providers/product_details_provider.dart';

class ProductDetails extends ConsumerWidget {
  final Product product;
  ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context, ref) {
    final isProductOnCart = ref.watch(cartsProvider).where((element) => element.id == product.id).toList().isNotEmpty;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(color: Colors.blueGrey),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 400.0,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2.0),
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                      image: NetworkImage("${product.image}"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "${product.title}",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      "Price : \$ ${product.price}",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 163, 46, 22),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            width: 70.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color: Color.fromARGB(255, 186, 71, 71),
                            ),
                            child: Center(
                              child: Text(
                                "Buy",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white60),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            isProductOnCart ? ref.read(cartsProvider.notifier).removeFromCart(product.id):
                            ref.read(cartsProvider.notifier).addToCart(product);
                          },
                          child: Row(
                            children: [
                              isProductOnCart ?Text("Remove from cart"):
                              Text("Add to cart"),
                              Container(
                                child: Icon(
                                  Icons.shopping_cart,
                                  color: Color.fromARGB(255, 186, 71, 71),
                                  size: 35.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Description",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w600),
                      ),
                      Divider(),
                      Text(
                        "${product.description}",
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.white60),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
