import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_store/screens/product_details_screen.dart';

import '../models/product_model.dart';

class ProductCard extends ConsumerWidget {
  final Product product;

  ProductCard(this.product);

  @override
  Widget build(BuildContext context, ref) {
    // final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14.0),
                  topRight: Radius.circular(14.0)),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetails(product: product),
                    ),
                  );
                },
                child: Image.network(
                  "${product.image}",
                  height: 180.0,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 4.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${product.title}",
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Text(
                  "\$ ${product.price}",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 163, 46, 22),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
