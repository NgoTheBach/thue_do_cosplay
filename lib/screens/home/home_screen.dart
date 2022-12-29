import 'package:flutter/material.dart';
import 'package:thue_do_cosplay/components/custom_bottom_nav_bar.dart';
import 'package:thue_do_cosplay/enums.dart';
import 'package:thue_do_cosplay/screens/home/components/body.dart';


class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}