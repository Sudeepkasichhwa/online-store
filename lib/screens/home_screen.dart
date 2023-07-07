import 'package:flutter/material.dart';
import 'package:online_store/screens/search_screen.dart';
import 'package:online_store/widgets/product_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(widget.title,style: TextStyle(color: Colors.white),),
        actions: [
          Padding(
              padding: EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(
                  Icons.search_rounded,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchProduct(),
                    ),
                  );
                },
              )),
        ],
      ),
      body: ProductCard(),
      backgroundColor: Colors.grey,
    );
  }
}
