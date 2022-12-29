import 'package:flutter/material.dart';
import 'package:thue_do_cosplay/screens/sign_in/components/body.dart';


class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Đăng nhập"),
      ),
      body: Body(),
    );
  }
}
