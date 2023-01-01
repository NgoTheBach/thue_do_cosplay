import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:thue_do_cosplay/api/cart.dart';
import 'package:thue_do_cosplay/constants.dart';
import 'package:thue_do_cosplay/models/All.dart';
import 'package:thue_do_cosplay/screens/cart/components/cart.dart';
import 'package:thue_do_cosplay/shared_preferences.dart';

import '../../../size_config.dart';

class Body extends StatefulWidget {
  Body({Key? key, required this.carts}) : super(key: key);

  List<Cart> carts;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
        itemCount: widget.carts.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: ClipRect(
            child: Dismissible(
              // key: Key(widget.carts[index].product_id),
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                _dismissDialog() {
                  Navigator.pop(context);
                }

                showDialog(
                    context: context,
                    builder: (newContext) {
                      return AlertDialog(
                        title: Text('Thông báo'),
                        content: Text('Bạn có muốn xoá mặt hàng này không?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              _dismissDialog();
                              setState(() {});
                            },
                            child: Text('Không'),
                          ),
                          TextButton(
                            onPressed: () async {
                              _dismissDialog();
                              bool a = await deleteCart(
                                  BaseSharedPreferences.getString('idUser'),
                                  widget.carts[index].idProduct);
                              if (a == true) {
                                setState(() {
                                  widget.carts.removeAt(index);
                                  Provider.of<Calculate>(context, listen: false)
                                      .update();
                                });
                              }
                            },
                            child: Text('Có'),
                          ),
                        ],
                      );
                    });
              },
              background: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Color(0xFFFFE6E6),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Spacer(),
                    SvgPicture.asset("assets/icons/Trash.svg"),
                  ],
                ),
              ),
              child: CartCard(cart: widget.carts[index]),
            ),
          ),
        ),
      ),
    );
  }
}
