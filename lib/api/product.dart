import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:thue_do_cosplay/constants.dart';
import 'package:thue_do_cosplay/models/All.dart';
// import 'package:shop_app/shared_preferences.dart';

Future<List<Product>?> getProducts() async {
  final response =
      await http.get(Uri.parse(API_URL + '/api/products/get-products'));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    //if (data['success'] == false) return null;
    List<Product> products = [];
    for (var item in data['data']) {
      products.add(Product.fromJson(item));
    }
    // print(products[0].product_name);
    return products;
  } else {
    throw Exception('Failed to load products');
  }
}

// Future<List<Product>?> getProductsBySearch(
//     String keyword, int page, int limit) async {
//   final response = await http.get(Uri.parse(API_URL +
//       '?action=search_products&keyword=$keyword&page=$page&limit=$limit'));

//   if (response.statusCode == 200) {
//     final data = jsonDecode(response.body);
//     if (data['success'] == false) return null;
//     List<Product> products = [];
//     for (var item in data['data']) {
//       products.add(Product.fromJson(item));
//     }
//     // print(products[0].product_name);
//     return products;
//   } else {
//     throw Exception('Failed to load products');
//   }
// }
