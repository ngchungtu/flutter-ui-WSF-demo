import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:plant_app/models/products.dart';

class ProductProvider extends ChangeNotifier {
  bool isLoading = false;
  List<Product> productList = [];

  static Future<List<Product>> fetchData() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
        print('response product: $response');
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List<dynamic>;
      // print('data_product: $data');
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
