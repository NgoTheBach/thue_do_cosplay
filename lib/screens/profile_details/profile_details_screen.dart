import 'package:flutter/material.dart';
import 'package:thue_do_cosplay/screens/profile_details/components/body.dart';



class ProfileDetailsScreen extends StatelessWidget {
  static String routeName = "/profile_details";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thông tin tài khoản"),
      ),
      body: Body(),
    );
  }
}
