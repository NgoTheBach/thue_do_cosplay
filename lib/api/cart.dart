import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:thue_do_cosplay/constants.dart';
import 'package:thue_do_cosplay/models/All.dart';
// import 'package:shop_app/shared_preferences.dart';

Future<List<Cart>?> getCarts(Future<String> _userId) async {
  String userId = await _userId;
  // print(userId);
  final response =
      await http.get(Uri.parse(API_URL + '/api/carts/get-cart/' + userId));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    //if (data['success'] == false) return null;
    List<Cart> carts = [];
    for (var item in data['data']) {
      carts.add(Cart.fromJson(item));
    }
    return carts;
  } else {
    throw Exception('Failed to load carts');
  }
}

Future<bool> postCart(
    Future<String> idUser, String idProduct, int cartProductQuantity) async {
  String userId = await idUser;
  Map<String, dynamic> map = {
    'idUser': userId,
    'idProduct': idProduct,
    'cartProductQuantity': cartProductQuantity.toString()
  };
  print(userId);
  print(idProduct);
  print(cartProductQuantity);

  final response = await http.post(
    Uri.parse(API_URL + '/api/carts/create-cart'),
    headers: <String, String>{
      'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
    },
    body: map,
  );

  if (response.statusCode == 200)
    return true;
  else
    return false;
}

Future<bool> deleteCart(Future<String> _userId, String idProduct) async {
  String userId = await _userId;
  Map<String, dynamic> map = {'idUser': userId, 'idProduct': idProduct};
  final response = await http.delete(
    Uri.parse(API_URL + '/api/carts/delete-cart'),
    headers: <String, String>{
      'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
    },
    body: map,
  );

  if (response.statusCode == 200)
    return true;
  else
    return false;
}
