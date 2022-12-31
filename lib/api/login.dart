import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:thue_do_cosplay/constants.dart';
import 'package:thue_do_cosplay/models/All.dart';
import 'package:thue_do_cosplay/shared_preferences.dart';

Future<User?> fetchLogin(String email, String password) async {
  Map<String, dynamic> map = {'email': email, 'password': password};
  final response = await http.post(
    Uri.parse(API_URL + '/api/users/login'),
    headers: <String, String>{
      'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
    },
    body: map,
  );
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    final data = jsonDecode(response.body);
    print(data);
    if (data['success'] == false) return null;
    return User.fromJson(data['data']);
  } else {
    throw Exception('Failed to load info');
  }
}

Future<bool> saveLogin(User user) async {
  await BaseSharedPreferences.setString('idUser', user.idUser);
  await BaseSharedPreferences.setString('firstName', user.firstName);
  await BaseSharedPreferences.setString('lastName', user.lastName);
  await BaseSharedPreferences.setString('email', user.email);
  // await BaseSharedPreferences.setString('user_token', user.user_token ?? '');
  return true;
}
