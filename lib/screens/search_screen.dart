import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_store/widgets/product_card.dart';

import '../provider/product_details_provider.dart';

class SearchProduct extends ConsumerStatefulWidget {
  SearchProduct({super.key});

  @override
  ConsumerState<SearchProduct> createState() => _SearchProductState();
}

class _SearchProductState extends ConsumerState<SearchProduct> {
  String searchQuery = '';

  @override
  Widget build(
    BuildContext context,
  ) {
    final products = ref.watch(productsProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Container(
            width: double.infinity,
            height: 50.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0), color: Colors.white),
            child: TextField(
              onChanged: (val) {
                setState(() {
                  searchQuery = val;
                });
              },
              autofocus: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
                hintText: "Search your product ...",
                isDense: true,
                hoverColor: Colors.white,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.clear),
                ),
              ),
            ),
          ),
        ),
        body: Center(
          child: Container(),
          // searchQuery.toLowerCase().contains(products[0].title.toLowerCase())? ProductCard(products[0]):
        ),
      ),
    );
  }
}
