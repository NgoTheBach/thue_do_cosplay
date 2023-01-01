import 'package:flutter/material.dart';
import 'package:thue_do_cosplay/components/custom_bottom_nav_bar.dart';
import 'package:thue_do_cosplay/enums.dart';
import 'package:thue_do_cosplay/screens/category/components/body.dart';

class CategoryScreen extends StatelessWidget {
  static String routeName = "/category";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.category),
    );
  }
}
