import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thue_do_cosplay/api/cart.dart';
import 'package:thue_do_cosplay/constants.dart';
import 'package:thue_do_cosplay/models/All.dart';
import 'package:thue_do_cosplay/shared_preferences.dart';

import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";

  List<Cart> listCarts = [];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Calculate>(
      create: (context) => Calculate(carts: listCarts),
      child: FutureBuilder<List<Cart>?>(
        future: getCarts(BaseSharedPreferences.getString('idUser')),
        builder: (context, AsyncSnapshot<List<Cart>?> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              // return Text('Loading...');
              return Scaffold(
                body: Text('Loading...'),
              );
            default:
              if (snapshot.hasError) {
                print('Error here: ${snapshot.error}');
                // return Text('Wut.');
                return Scaffold(
                  appBar: buildAppBar(context),
                  body: Text('Wut.'),
                  bottomNavigationBar: CheckoutCard(),
                );
              } else {
                listCarts = snapshot.data!;
                // Provider.of<Calculate>(context, listen: false).update();
                context.read<Calculate>().update();
                return Scaffold(
                  appBar: buildAppBar(context),
                  body: Body(carts: listCarts),
                  bottomNavigationBar: CheckoutCard(),
                );
              }
          }
        },
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Giỏ hàng nè",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "${context.watch<Calculate>().num} items",
            // 'Lướt sản phẩm qua trái để xoá',
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
