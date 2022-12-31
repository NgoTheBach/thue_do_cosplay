import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:thue_do_cosplay/constants.dart';
import 'package:thue_do_cosplay/models/All.dart';

Future<User?> getUser(Future<String> _userId) async {
  String userId = await _userId;
  final response = await http
      .get(Uri.parse(API_URL + '/api/users/get-user-by-id/' + userId));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    if (data['success'] == false) return null;
    return User.fromJson(data['data']);
  } else
    return null;
}

Future<bool> updateUser(
    Future<String> _userId,
    String userFirstname,
    String userLastName,
    String userEmail,
    // String? userPhoneNumber,
    // String? userAddress,
    String userPassword) async {
  String userId = await _userId;
  Map<String, dynamic> map = {
    'idUser': userId,
    'firstName': userFirstname,
    'lastName': userLastName,

    'email': userEmail,
    // 'address': userAddress,
    // 'phoneNumber': userPhoneNumber,
    'address': '',
    'phoneNumber': '123',
    'password': userPassword,
  };
  final response = await http.post(
    Uri.parse(API_URL + '/api/users/update-user'),
    headers: <String, String>{
      'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
    },
    body: map,
  );

  if (response.statusCode == 200) {
    print(userId);
    return true;
  } else
    return false;
}
