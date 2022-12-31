import 'dart:convert';

import 'package:thue_do_cosplay/shared_preferences.dart';

Future<bool> logout() async {
  await BaseSharedPreferences.remove('user_id');
  await BaseSharedPreferences.remove('user_fullname');
  await BaseSharedPreferences.remove('user_email');
  await BaseSharedPreferences.remove('user_token');
  await BaseSharedPreferences.remove('skip_splash');
  return true;
}
