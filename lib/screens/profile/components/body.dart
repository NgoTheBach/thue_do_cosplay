import 'package:flutter/material.dart';
import 'package:thue_do_cosplay/api/logout.dart';
import 'package:thue_do_cosplay/screens/invoice/invoice_screen.dart';
import 'package:thue_do_cosplay/screens/profile/components/about.dart';
import 'package:thue_do_cosplay/screens/profile/components/profile_menu.dart';
import 'package:thue_do_cosplay/screens/profile/components/profile_pic.dart';
import 'package:thue_do_cosplay/screens/profile_details/profile_details_screen.dart';
import 'package:thue_do_cosplay/screens/sign_in/sign_in_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "Thông tin tài khoản",
            icon: "assets/icons/User Icon.svg",
            press: () {
              Navigator.pushNamed(context, ProfileDetailsScreen.routeName);
            },
          ),
          ProfileMenu(
            text: "Đơn hàng",
            icon: "assets/icons/Bell.svg",
            press: () {
              Navigator.pushNamed(context, InvoiceScreen.routeName);
            },
          ),
          // ProfileMenu(
          //   text: "Settings",
          //   icon: "assets/icons/Settings.svg",
          //   press: () {},
          // ),
          ProfileMenu(
            text: "Giới thiệu",
            icon: "assets/icons/Question mark.svg",
            press: () {
              Navigator.pushNamed(context, AboutScreen.routeName);
            },
          ),
          ProfileMenu(
            text: "Đăng xuất",
            icon: "assets/icons/Log out.svg",
            press: () {
              print('Đăng xuất!!!');

              _dismissDialog() {
                Navigator.pop(context);
              }

              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Thông báo'),
                      content: Text('Bạn có muốn đăng xuất không?'),
                      actions: <Widget>[
                        TextButton(
                            onPressed: () {
                              _dismissDialog();
                            },
                            child: Text('Không')),
                        TextButton(
                          onPressed: () async {
                            _dismissDialog();
                            await logout();
                            Navigator.pushNamed(
                                context, SignInScreen.routeName);
                          },
                          child: Text('Có'),
                        )
                      ],
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}
