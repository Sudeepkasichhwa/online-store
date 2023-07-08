import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_store/widgets/product_card.dart';

import '../providers/product_details_provider.dart';

class SearchProduct extends ConsumerStatefulWidget {
  SearchProduct({super.key});

  @override
  ConsumerState<SearchProduct> createState() => _SearchProductState();
}

class _SearchProductState extends ConsumerState<SearchProduct> {
  List filteredProducts = [];

  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final products = ref.watch(productsProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0), color: Colors.white),
            child: TextField(
              controller: _searchController,
              onChanged: (val) {
          
                final filteredList = val == ''? []:products
                    .where((product) =>
                        product.title.toLowerCase().contains(val.toLowerCase()))
                    .toList();
                setState(() {
                  filteredProducts = filteredList;
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
                  onPressed: () {
                    _searchController.clear();
                  },
                  icon: Icon(Icons.clear),
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: filteredProducts.isEmpty?Center(child: Text("No results found !!"))
          :GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: filteredProducts.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 5.0,
              mainAxisExtent: 260.0,
            ),
            itemBuilder: (context, index) {
              return Container(
                child: ProductCard(filteredProducts[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}
