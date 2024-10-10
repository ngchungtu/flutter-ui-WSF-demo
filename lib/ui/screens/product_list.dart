import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:plant_app/models/products.dart';
import 'package:http/http.dart' as http;
import 'package:plant_app/ui/screens/widgets/product_item.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> productList = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    // you can replace your api link with this link
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      // print('data rendered: $jsonData');
      setState(() {
        productList = jsonData.map((data) => Product.fromJson(data)).toList();
      });
    } else {
      // Handle error if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productList.length,
      itemBuilder: (context, index) {
        final product = productList[index];
        return ProductItem(product: product);
      },
    );
  }
}
