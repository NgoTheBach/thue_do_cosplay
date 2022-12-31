import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:thue_do_cosplay/constants.dart';

Future<bool?> fetchRegister(
    String firstName, String lastName, String email, String password) async {
  Map<String, dynamic> map = {
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'password': password
  };
  final response = await http.post(
    Uri.parse(API_URL + '/api/users/create-user'),
    headers: <String, String>{
      'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
    },
    body: map,
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    print(data);
    return true;
  } else {
    return null;
  }
}
